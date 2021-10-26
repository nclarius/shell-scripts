#!/bin/bash

###############
# Automatic manual duplex printing
# (C) 2021 Natalie Clarius <natalie_clarius@yahoo.de>
# GNU General Public License v3.0
###############

###############
# configuration
###############
printer=Epson_Stylus_SX440
order=1

###############
# initialization
###############

# usage
if [ $# -eq 0 ]  # no arguments given
then
    echo "Usage: lpd <F> [<S> <E> <M> <C>]"
    echo "  F: file name"
    echo "  S: start of page range to print"
    echo "  E: end   of page range to print"
    echo "  M: multipage: number of pages per side"
    echo "  C: color mode: 'c': colored (default), 'g': gray scale"
    echo "Either no or options, only S and R, or all options have to be provided."
    echo "Examples:"
    echo "  $ lpd example.pdf                # print example.pdf"
    echo "  $ lpd example.pdf 4 10           # print example.pdf pages 4-10"
    echo "  $ lpd example.pdf 4 10 2 g       # print example.pdf pages 4-10 with two pages per side in gray scale"
    exit
fi

# initial variables
filename=$1                                              # file name
num_pages=$(pdfinfo $1 | grep Pages | awk '{print $2}')  # number of pages in document
[ -z "$2" ] && start=1 || start=$2                       # start of page range (default: 1)
[ -z "$3" ] && end=$num_pages || end=$3                  # end   of page range (default: num_pages)
[ -z "$4" ] && multi=1 || multi=$4                       # pages per side (default: 1)
([ -z "$5" ] || [ "$5" == "c" ]) && color=true || color=false  # color

# get page ranges
first=$(( ($start+$multi-1)/$multi ))                    # first multipage to print
last=$(( ($end+$multi-1)/$multi ))                       # last  multipage to print
start_=$(( (($first-1)*$multi)+1  ))                     # start of printed page range
end_=$(( $last*$multi ))                                 # end   of printed page range
num_sheets=$(( $last-$first+1 ))                         # number of output

# sort into front, back and remainder pages
front_=()
back_=()

i=1
for ((p=first; p<=last; p++))
do
  if ((i % 2))
  then
      front_+=($p)  # odd  multipages to front
  else
      back_+=($p)  # even multipages to back
  fi
  i=$((i+1))
done

if [[ ${#back_[@]} -eq 0 ]]  # only single front page
then
  backapges=false
  remainder=false
else
  backpages=true

  if (( ${#front_[@]} > ${#back_[@]} ))  # more front than back pages
  then
      remainder=true
  fi
fi

# convert page range to comma-separated string
function join_by { local IFS="$1"; shift; echo "$*"; }
front=$(join_by , "${front_[@]}")
back=$(join_by , "${back_[@]}")

# notify user of initialization
echo "Duplex print"
echo "File: $filename"
echo "Page range: $start_-$end_"
echo "Pages per sheet: $multi"
echo "Number of pages: $num_sheets"
echo "Colored: $color"
echo "Continue (y/n)?"
read confirm
if [ "$confirm" != "y" ] && [ "$confirm" != "" ]
then
    echo "Cancelled"
    exit 3
fi
echo "Printing ..."
echo ""

###############
# printing
###############

# execute print job
send_print_job () {   # send print job and return job id
    # $1: file name, $2: page range, $3: multi, $4: reverse, $5: color
    printrequest="lp -d $printer" # basic print request
    if [[ $# -eq 0 ]]
    then
        echo $(lp -d $printer <<< "" | sed -e "s/request id is \(.*\) (0 file(s))/\1/") # last empty backpage
    else
        printrequest="lp -d $printer" # basic print request
        printrequest+=" -o page-ranges=$2" # page range
        if [[ "$3" = true ]]; then printrequest+=" -o number-up=$3"; fi  # multi-page print
        if [[ "$4" = true ]]; then printrequest+=" -o outputorder=reverse"; fi # reverse order
        if [[ "$5" = false ]]; then printrequest+=" -o Color=Grayscale"; fi # color
        printrequest+=" $1 " # file name
        echo $($printrequest | sed -e "s/request id is \(.*\) (1 file(s))/\1/")
    fi
}

# monitor print job status
monitor_print_job () {
    # $1: job id
    completed=false
    until $completed
    do
        sleep 5  # check only every 5 seconds
        completed_jobs=$(lpstat -W completed $printer | awk "{print \$1}")  # get completed print jobs
        if [[ "$completed_jobs" == *"$1"* ]]; then completed=true; fi                 # check if current job is among completed; if yes, proceed
    done
}

# print
if [[ "$order" == 1 ]] # order variant 1: first front pages, then back pages, then last empty back page
then

    # print front pages
    reverse=false
    front_job=$(send_print_job $filename $front $multi $reverse $color)
    monitor_print_job $front_job

    if [[ "$backpages" = true ]]
    then
        # prompt user to turn paper
        echo "Please turn the paper, then press Enter."
        read confirm

        # print back pages
        reverse=false
        back_job=$(send_print_job $filename $back $multi $reverse $color)
        monitor_print_job $back_job

        # print last empty back page
        if [[ "$remainder" = true ]]
        then
            remainder_job=$(send_print_job)
            monitor_print_job $remainder_job
        fi
    fi

elif [[ "$order" == 2 ]] # order variant 2: first reversed back pages, then front pages
then
    if [[ "$backpages" = true ]]
    then

        # print back pages
        reverse=true
        back_job=$(send_print_job $filename $back $multi $reverse $color)
        monitor_print_job $back_job

        # prompt user to turn paper
        echo "Please turn the paper, then press Enter."
        read confirm
    fi

    # print front pages
    reverse=false
    front_job=$(send_print_job $filename $front $multi $reverse $color)
    monitor_print_job $front_job
fi

# notify user of completion
echo "Done"

#!/bin/bash

###############
# Use a modifier-only shorcut (meta key in isolation) to open KRunner if it is not open, and to close it if it is open
# (C) 2021 Natalie Clarius <natalie_clarius@yahoo.de>
# GNU General Public License v3.0
###############

# define mapping between shortcut and URL of edit page of respective file in moodle
declare -A linkmap=(
    ["test"]="https://moodle.zdv.uni-tuebingen.de/course/modedit.php?update=25041&Return=1"
    ["teamanmeldungsstatus"]="https://moodle.zdv.uni-tuebingen.de/course/modedit.php?update=26059&return=0&sr=0"
)

# define mapping between shortcut and path of file to upload
declare -A pathmap=(
    ["test"]="/home/natalie/Dropbox/Dokumente/Coding/Latex/Sonst/test.pdf"
    ["teamanmeldungsstatus"]="/home/natalie/Dropbox/Uni/Tut_Logik/Übungen/Teamanmeldungsstatus.log"
)

url="${linkmap[$1]}"
filepath="${pathmap[$1]}"

firefox $url; sleep 7s  # open edit page
for i in {1..24}; do xdotool key Tab; done; xdotool key Return; sleep 1s  # file adding button
for i in {1...1}; do xdotool key Tab; done; xdotool key Return; sleep 1s  # upload dialog
xdotool key "ctrl+l"; xdotool type $filepath; xdotool key Return; sleep 1s  # insert file path
for i in {1..9}; do xdotool key Tab; done; xdotool key Return; sleep 1s  # confirm upload file
for i in {1..2}; do xdotool key Tab; done; xdotool key Return; sleep 1s  # confirm overwrite
for i in {1..38}; do xdotool key Tab; done ; xdotool key Return; sleep 8s # save
xdotool key "ctrl+w"; xdotool key "alt+Tab"  # close tab and back to pevious window

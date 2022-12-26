#!/bin/sh

timer_file=$(dirname $(realpath "$0"))"/alt_tab_timer.txt"
timeout=1

if [[ $(( $(date +%s%N | cut -b1-13 ) - $(cat "$timer_file") )) -ge 1000 ]]
then	
	xdotool keydown alt
fi
date +%s%N  | cut -b1-13 > "$timer_file"

case "$@" in
	shift)
		xdotool key Shift+Tab
		;;
	*)
		xdotool key Tab
		;;
esac

sleep $timeout
if [[ $(( $(date +%s%N | cut -b1-13) - $(cat "$timer_file") )) -ge 1000 ]]
then
	xdotool keyup alt
fi

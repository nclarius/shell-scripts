#!/bin/sh

###############
# Cycle windows
# (C) 2022 Natalie Clarius <natalie_clarius@yahoo.de>
# GNU General Public License v3.0
###############

timer_file=$(dirname $(realpath "$0"))"/alt_tab_timer.txt"

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

sleep 1
if [[ $(( $(date +%s%N | cut -b1-13) - $(cat "$timer_file") )) -ge 1000 ]]
then
	xdotool keyup alt
fi

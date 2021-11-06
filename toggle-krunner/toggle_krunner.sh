#!/bin/bash

###############
# Use a modifier-only shorcut (meta key in isolation) to open KRunner if it is not open, and to close it if it is open
# (C) 2021 Natalie Clarius <natalie_clarius@yahoo.de>
# GNU General Public License v3.0
###############

krunnerWindow=$(xdotool getwindowfocus getwindowname)
if [[ $krunnerWindow == *"krunner"* ]]; then
    xdotool key 'Escape'
    exit 0
else
    qdbus org.kde.krunner /App display
    exit 0
fi

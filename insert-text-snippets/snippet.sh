#!/bin/bash

###############
# Insert predefined text snippets
# (C) 2022 Natalie Clarius <natalie_clarius@yahoo.de>
# GNU General Public License v3.0
###############

sleep 0.2
xdotool type --delay 10 "$(cat "$1")"

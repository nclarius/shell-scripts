#!/bin/bash

###############
# Make Firefox always open on the current virtual desktop
# (C) 2021 Natalie Clarius <natalie_clarius@yahoo.de>
# GNU General Public License v3.0
###############

win_class="Navigator.firefox"
launch_new="firefox -new-window"
launch_old="firefox -new-tab"

curr_desktop=$(wmctrl -d | grep '*' | cut -d ' ' -f1)
instances_curr=$(wmctrl -l -x | awk -v win_class="$win_class" -v curr_desktop=$curr_desktop '{if (($2 == curr_desktop || $2 == -1) && $3 == win_class) {print $1} }')

if [[ -z $instances_curr ]]; then
    # no instance on the current desktop: open in new window on current desktop
    $launch_new $1
else
    # instance on the current desktop: open in existing window on current desktop
    $launch_old $1
fi

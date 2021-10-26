#!/bin/bash

###############
# Make Thunderbird always open on the current virtual desktop
# (C) 2021 Natalie Clarius <natalie_clarius@yahoo.de>
# GNU General Public License v3.0
###############

win_class="Mail.Thunderbird"
launch="thunderbird"

curr_desktop=$(wmctrl -d | grep '*' | cut -d ' ' -f1)
instance_other=$(wmctrl -l -x | awk -v win_class="$win_class" '{if ($2 != -1 && $3 == win_class) {print $1} }')

if [[ -n $instance_other ]]; then
    # existing instance on some (current or other) single desktop: move to current desktop
    wmctrl -i -r $instance_other -t $curr_desktop
fi
# no instance or existing instance on current (single or all) desktop: open (new) window
$launch

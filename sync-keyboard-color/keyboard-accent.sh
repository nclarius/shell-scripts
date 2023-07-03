#!/bin/bash

###############
# Sync keyboard backlight with KDE accent color
# (C) 2023 Natalie Clarius <natalie_clarius@yahoo.de>
# GNU General Public License v3.0
###############

color=$(kreadconfig5 --file "kdeglobals" --group "General" --key "AccentColor") && [[ -n "$color" ]] || color=$(kreadconfig5 --file "kdeglobals" --group "Colors:View" --key "DecorationFocus")  # get accent color
# todo: reformat from hexadecimal to rgb if necessary
color="${color//,/ }"  # reformat

for key in /sys/class/leds/rgb:kbd_backlight*; do
	echo "$color" | sudo tee $key/multi_intensity  # write color
    # todo check that key actually is rgb
done

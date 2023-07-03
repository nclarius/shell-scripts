#!/bin/bash

###############
# Sync keyboard backlight with KDE accent color
# (C) 2023 Natalie Clarius <natalie_clarius@yahoo.de>
# GNU General Public License v3.0
###############

function get_kde_color() {
    IFS="," read -A color <<< $(kreadconfig5 --file kdeglobals --group "$1" --key "$2")
    if [[ $color != \#* ]]; then color=$(printf "#%02x%02x%02x\n" $color); fi
    echo $color
}
accent=$(get_kde_color General AccentColor) && [[  $accent != "#000000" ]] || accent=$(get_kde_color Colors:View DecorationFocus)

echo "$accent"

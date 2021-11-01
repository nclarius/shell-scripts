#!/bin/bash

###############
# Use a modifier-only shorcut (meta key in isolation) to open KRunner if it is not open, and to close it if it is open
# (C) 2021 Natalie Clarius <natalie_clarius@yahoo.de>
# GNU General Public License v3.0
###############

# Usage:
# ------
#
# 1. make script executable:
#    richt-click on this file > Properties > Permissions > is executable
#
# 2. add custom shortcut:
#    System Settings > Shortcuts > Custom Shortcuts > Edit > New > Global Shortcut > Command/URL
#    - Name: toggle KRunner
#    - Comment: toggle KRunner
#    - Trigger: some shortcut of your choice e.g. Meta+Esc
#    - Action: sh /path_to_this_script/toggle_krunner.sh
#
# 3. find UID of shortcut:
#    ~/.config/khotkeysrc
#    - search for 'KRunner', get sectoin name [Data_n], e.g. [Data_8]
#    - get Uuid from section [Data_n_Triggers0], e.g. {64d38c94-2342-424a-a782-1139f1e4ca59}
#
# 4. set modifier-only shortcut:
#    edit ~/.config/.kwincr:
#
#       ...
#       [ModifierOnlyShortcuts]
#       ...
#       Meta=org.kde.kglobalaccel,/component/khotkeys,org.kde.kglobalaccel.Component,invokeShortcut,{Uuid}
#       ...
#
#    with the Uuid inserted into the curly braces
#

krunnerWindow=$(xdotool getwindowfocus getwindowname)
if [[ $krunnerWindow == *"krunner"* ]]; then
    xdotool key 'Escape'
    exit 0
else
    qdbus org.kde.krunner /App display
    exit 0
fi

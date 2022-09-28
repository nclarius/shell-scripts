#!/bin/bash
case $(kreadconfig5 --file /home/natalie/.config/kdeglobals --group General --key ColorScheme) in
    "KolorsLight") /home/natalie/Dropbox/Code/Shell/kolors_dark.sh;;
    "KolorsDark") /home/natalie/Dropbox/Code/Shell/kolors_light.sh;;
esac

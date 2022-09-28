#!/bin/bash
plasma-apply-colorscheme KolorsLight
plasma-apply-wallpaperimage /home/natalie/Dropbox/Bilder/Hintergrundbilder/Kolors/Light.jpg
plasma-apply-cursortheme breeze_cursors
kwriteconfig5 --file kdeglobals --group Icons --key Theme Tela
kwriteconfig5 --file /home/natalie/.local/share/konsole/zsh.profile --group Appearance --key ColorScheme KolorsLight
sed -i 's/"workbench.colorTheme": "Kolors Dark"/"workbench.colorTheme": "Kolors Light"/g' /home/natalie/.config/Code\ -\ OSS/User/settings.json
sed -i 's/breeze_dark/breeze/g' /home/natalie/.config/libreoffice/4/user/registrymodifications.xcu

#!/bin/bash
plasma-apply-colorscheme KolorsDark
plasma-apply-wallpaperimage /home/natalie/Dropbox/Bilder/Hintergrundbilder/Kolors/Dark.jpg
plasma-apply-cursortheme Breeze_Snow
kwriteconfig5 --file kdeglobals --group Icons --key Theme Tela-dark
kwriteconfig5 --file /home/natalie/.local/share/konsole/zsh.profile --group Appearance --key ColorScheme KolorsDark
sed -i 's/"workbench.colorTheme": "Kolors Light"/"workbench.colorTheme": "Kolors Dark"/g' /home/natalie/.config/Code\ -\ OSS/User/settings.json
sed -i 's/breeze/breeze_dark/g' /home/natalie/.config/libreoffice/4/user/registrymodifications.xcu

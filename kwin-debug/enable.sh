#!/bin/sh
name=$(grep -oP '(?<=X-KDE-PluginInfo-Name=).*' ./metadata.desktop)
kwriteconfig5 --file kwinrc --group Plugins --key "$name"Enabled true
qdbus org.kde.KWin /KWin reconfigure

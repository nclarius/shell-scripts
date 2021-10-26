# Always Open on Primary Screen

Extension for KDE’s window manager to make new windows always open on the monitor that is set as primary in *System Settings* > *Display and Monitor* > *Display Configuration* > checkbox *Primary*.

![alwaysopenonactivescreen](icon_small.png)

[view in KDE Store](https://store.kde.org/p/1617641)



## Installation

### Dependencies

`kwin` (tested with v5.22 - v5.23).

### Method 1: via graphical interface

1. Install the script via *System Settings* > *Window Management* > *KWin Scripts* > *Get New Scripts …* > search for *Always Open on Primary Screen* > *Install*.
2. Activate the script by selecting the checkbox in the respective entry.

### Method 2: via command line

```bash
git clone https://github.com/nclarius/shell-scripts.git
plasmapkg2 --type kwinscript -i shell-scripts/window-positioning/always-open-on-primary-screen
kwriteconfig5 --file kwinrc --group Plugins --key alwaysopenonprimaryscreenEnabled true
qdbus org.kde.KWin /KWin reconfigure
```



## Small Print

© 2021 Natalie Clarius \<natalie_clarius@yahoo.de\>

This work is licensed under the GNU General Public License v3.0.  
This program comes with absolutely no warranty.  
This is free software, and you are welcome to redistribute and/or modify it under certain conditions.  

If you would like to thank me, you can make me happy by [leaving a review](https://store.kde.org/p/1617641) or [buying me a tea](https://www.buymeacoffee.com/nclarius).


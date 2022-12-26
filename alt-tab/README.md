# Alt+Tab

Shell script to cycle between windows, intended for use as a touchhpad gesture. The core feature is a timer to to simulate alt being kept pressed, so that the whole list of windows rather than just the two most recent ones can be walked through with a quick succession of swipes.

## Dependencies

- `xdotool`
- a function provided by your window manager to walk through windows in forward and backwards order, bound to keyboard shortcuts Alt+Tab and Alt+Shift+Tab respectively

## Usage

```bash
alt_tab.sh  # switch windows in forwards direction
alt_tab.sh shift`  # switch windows in backwards direction
```

## Small Print

© 2022 Natalie Clarius \<natalie_clarius@yahoo.de\>

This work is licensed under the GNU General Public License v3.0.  
This program comes with absolutely no warranty.  
This is free software, and you are welcome to redistribute and/or modify it under certain conditions.  

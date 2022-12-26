# Alt+Tab

Shell script to cycle between windows, intended for use as a pair of touchhpad gestures. The core feature is a timer to simulate alt being kept pressed, so that with a quick succession of swipes, the whole list of windows rather than just the two most recent ones can be walked through.

## Dependencies

- `xdotool`
- a function provided by your window manager to walk through windows in forward and backwards order, bound to keyboard shortcuts like Alt+Tab and Alt+Shift+Tab respectively


## Configuration

To change the timeout duration (default: 1 second), change the occurrences of 1 and 1000 in the script.

To change the keyboard shortcut you have set up to cycle windows, change the occurrences of the alt, tab and shift key names in the script.

## Usage

```bash
alt_tab.sh  # switch windows in forwards direction
alt_tab.sh shift  # switch windows in backwards direction
```

## Small Print

© 2022 Natalie Clarius \<natalie_clarius@yahoo.de\>

This work is licensed under the GNU General Public License v3.0.  
This program comes with absolutely no warranty.  
This is free software, and you are welcome to redistribute and/or modify it under certain conditions.  

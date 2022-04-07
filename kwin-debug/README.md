# KWin Debug

KWin script printing window information for debugging purposes.

![screenshot](/home/natalie/Dropbox/Code/Shell/GitHub/kwin-debug/screenshot.png)

## Installation

### First installation

`./install.sh`

### After making changes to the script

`./update.sh`

### Enable/Disable the script

`./enable.sh`  
`./disable.sh`

## Configuration

To get only basic window properties or all window properties, in `contents/code/main.js` set the varibles `debugMode` and `fulldebugMode` to `true` or `false` respectively.

## Usage

Retrieve the script’s output from the journal:

- In the terminal: `journalctl -g 'kwindebug' -f`
- Or with the graphical application KSystemLog, filtered by message content "kwindebug".

This will show window information as windows are added or activated, i.e. simply click a window to print its properties. The log can be viewed live or retrospectively.


## Modificaiton

For more information on KWin scripting see [the official documentation](https://develop.kde.org/docs/extend/plasma/kwin/).


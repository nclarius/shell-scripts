# KWin Debug

KWin script printing window information for debugging purposes.

## Installation

### First installation

`./install.sh`

### After making changes to the script

`./update.sh`

### Enable/Disable the script

`./enable.sh`  
`./disable.sh`

## Usage

Retrieve the script’s output from the journal:

- In the terminal: `journalctl -g 'kwindebug' -f`
- Or with the graphical application KSystemLog, filtered by message content "kwindebug".

This will show window properties as windows are added or activated. The log can be viewed live or retrospectively.

To get only basic window properties or all window properties, set the respective varibles in `contents/code/main.js`.

## Modificaiton

For more information on KWin scripting see [the official documentation](https://develop.kde.org/docs/extend/plasma/kwin/).


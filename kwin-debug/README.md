# KWin Debug

KWin script printing window information for debugging purposes.

## Installation

For instructions how to install a KWin script, see [the KWin scripting tutorial](https://bugs.kde.org/show_bug.cgi?id=445058).

## Usage

Retrieve the script’s output from the journal:

`journalctl -g 'kwindebug' -f`

This will continuously print window properties as windows are added or activated. 

## Modification

For more properties to be queried, see [the official documentation for KWin scripting API](https://develop.kde.org/docs/extend/plasma/kwin/api/).

# Insert Text Snippets

Shell script to insert predefined text snippets with a shortcut.

## Dependencies

- `xdotool` (or `ydotool` and modify the script accordingly)

## Set-up

- Make the script executable (or else call it with `sh` when you run the command).
- Put the script in a location that is in PATH (or else call it with its full path when you run the command).
- For each text snippet, save it as a plain text file `/path/to/snippet.txt`.

## Set-up a keyboard shortcut (for KDE)

- For each text snippet:  
  System Settings > Shortcuts > Custom Shortcuts >   
  Edit > New > Global Shortcut > Command/URL >   
  Trigger > Shortcut: set keyboard shortcut;  
  Action > Command/URL: `snippet /path/to/snippet.txt`  


## Usage

### Command-line

```bash
snippet /path/to/snippet.txt
```

### Keyboad shortcut

Press the keyboard shortcut you defined for the snippet.


## Small Print

© 2022 Natalie Clarius \<natalie_clarius@yahoo.de\>

This work is licensed under the GNU General Public License v3.0.  
This program comes with absolutely no warranty.  
This is free software, and you are welcome to redistribute and/or modify it under certain conditions.  

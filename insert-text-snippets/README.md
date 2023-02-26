# Insert Text Snippets

Shell script to insert predefined text snippets with a shortcut.

## Dependencies

- `xdotool` (or `ydotool` and modify the script accordingly)

## Set-up (for KDE Plasma)

- Download the script.
- For each text snippet:  
  - Save it as a plain text file.
  - System Settings > Shortcuts > Add Command > `sh PATH_TO_THE_SCRIPT PATH_TO_THE_SNIPPET`, eg `sh ~/scripts/snippet.sh ~/snippets/hello.txt`.
  - Choose the newly added shortcut from the list in the section "Commands", and set your preferred key combination.

## Small Print

© 2022-2023 Natalie Clarius \<natalie_clarius@yahoo.de\>

This work is licensed under the GNU General Public License v3.0.  
This program comes with absolutely no warranty.  
This is free software, and you are welcome to redistribute and/or modify it under certain conditions.  

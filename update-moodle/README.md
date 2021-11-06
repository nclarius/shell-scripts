# Update Moodle

Shell script to automatize uploading files to the Moodle learning management system.  

It is intended to take over tedious clicking routines for material that needs frequent updating, but not suited to create new entries as each file requires an initial set-up.  

The script works by simulating key strokes (Tab and Enter etc.) to navigate the website in the browser. It’s ugly, fragile and looks scary but it works.



## Installation

1. Ensure dependencies are installed: `xdotool`.
2. Download the script: GitHub repository > green top right button *Code* > *Download ZIP* > unpack > extract the `update-moodle` folder.
3. Make the script executable: right-click on the `.sh` file > *Properties* > *Permissions* > checkbox *Is executable*.



## Set-up

For each file you want to update, specify the URL and file path and set up a shortcut:

1. Think of a shortcut name for the file you want to update.
2. In `update_moodle.sh`, add the URL to the Moodle edit page (Moodle > *Turn editing on* > entry you want to update > *Edit* > *Edit settings* > copy the URL from the address bar) to  the `linkmap` declaration in the form `["shortcut"]="url"`.
3. In `update_moodle.sh`, add the local path to the file you want to upload to the `pathmap` declaration in the form `["shortcut"]="path"`.

Since the functionality of the script depends on the precise structure of the Moodle webpage, it is recommended that before running the script for the first time, you manually keyboard-navigate through the Moodle edit page and confirm that the sequence of keystrokes used in the script indeed ends up in the desired website elements, and change the commands in the script if necessary.



## Usage

```bash
path_to_the_script/moodle.sh shortcut
```

where `shortcut` is the key for the Moodle file edit page URL and the file path defined as described above.



## Small Print

© 2021 Natalie Clarius \<natalie_clarius@yahoo.de\>

This work is licensed under the GNU General Public License v3.0.  
This program comes with absolutely no warranty.  
This is free software, and you are welcome to redistribute and/or modify it under certain conditions.  

If you would like to thank me, you can always make me happy with [a cup of tea](https://www.buymeacoffee.com/nclarius).


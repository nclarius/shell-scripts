# Open on Current Desktop

Shell script to make Firefox open a new window on the current virtual desktop rather than raising an existing window on another desktop if there is not already a window on the current desktop.
   
## Supported platforms

X11.

## Installation

1. Ensure dependencies are installed: `awk`, `cut`, `grep`, `wmctrl`.
2. Download the script: GitHub repository > green top right button *Code* > *Download ZIP* > unpack > extract the `open-on-current-desktop` folder.
3. Make the script executable: right-click on the `.sh` file > *Properties* > *Permissions* > checkbox *Is executable*.

## Set-up

1. Find out the window class of the program: Open an instance of the program, run `wmctrl -l -x ` in a terminal, and get the window class name from the third column, e.g. `Navigator.firefox` or `atom.Atom`.
2. Insert the window class as a string for the variable `win_class` in the script.
3. Find out the command to open the file in a new window, e.g. `firefox -new-window` or `atom -n`.
4. Insert the launch-new command as a string for the variable `launch_new` in the script.
5. Find out the command to open the file in an existing window, e.g. `firefox -new-tab` or `atom`.
6. Insert the launch-existing command as a string for the variable `launch_old` in the script.
7. Make the script the application to open the desired file types: *System Settings* > *Applications* > *File Associations* or ... > *Default Applications* > select relevant file types > add the path to the script and make it the top preference. Note that some applications may ignore the system-wide settings and define their own program association preferences; e.g. for Thunderbird see [these instructions](http://kb.mozillazine.org/Changing_the_web_browser_invoked_by_Thunderbird).
8. Make the script the command to be executed for any launcher you may have (task bar icon, [application menu entry](https://docs.kde.org/stable5/en/kmenuedit/kmenuedit/quickstart.html), [keyboard shortcut](https://www.reddit.com/r/linuxquestions/comments/jkxs8d/comment/gamggv7/?utm_source=share&utm_medium=web2x&context=3), …).


## Small Print

© 2021-2022 Natalie Clarius \<natalie_clarius@yahoo.de\>

This work is licensed under the GNU General Public License v3.0.  
This program comes with absolutely no warranty.  
This is free software, and you are welcome to redistribute and/or modify it under certain conditions. 

If you would like to thank me, you can always make me happy with a cup of coffee:  
<a href="https://www.paypal.com/donate/?hosted_button_id=7LUUJD83BWRM4"><img src="https://www.paypalobjects.com/en_US/DK/i/btn/btn_donateCC_LG.gif" height="35"/></a>&nbsp;&nbsp;<a href="https://www.buymeacoffee.com/nclarius"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="35"/></a>

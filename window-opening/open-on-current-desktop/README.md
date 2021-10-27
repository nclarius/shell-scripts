# Open on Current Desktop

Shell scripts to make specific applications always open on the current virtual desktop. This is trying to fix an annoying behavior with KWin where opening a window would sometimes unsolicitedly teleport you to a different desktop.

There are three cases when this happens: A program is already open on a different desktop, and either:

1. The program can only run one instance, e.g. Thunderbird.
2. The program prefers to open files in an existing window, e.g. Firefox.
3. The program raises other existing instances when opening a new file, e.g. Atom.

`open_thunderbird_on_current_desktop.sh` fixes problem 1 by moving a possible existing instance to the current desktop.

`open_firefox_on_current_desktop.sh` partially fixes problems 2 and 3 by instructing the program to open the file in a new window if there is no existing instance on the current desktop. However, problem 2 might not be entirely solved due to missing file associations, e.g. the Firefox script will work for bookmarks opened from KRunner but not for links opened from Thunderbird for some reason. As for problem 3, the window manager will in some cases still highlight the other window and open the file in the wrong existing window. If you have a better fix, please let me know.


## Installation

1. Ensure dependencies are installed: `awk`, `cut`, `grep`, `wmctrl`.
2. Download the script: GitHub repository > green top right button *Code* > *Download ZIP* > unpack > extract the `open-on-current-desktop` folder.
3. Make the script executable: right-click on the `.sh` file > *Properties* > *Permissions* > checkbox *Is executable*.



## Set-up

### 1. Programs that can only run one instance

With the script `open_thunderbird_on_current_desktop.sh`:

1. Find out the window class of the program: Open an instance of the program, run `wmctrl -l -x ` in a terminal, and get the window class name from the third column, e.g. `Mail.Thunderbird`.
3. Insert the window class as a string for the variable `win_class` in the script.
4. Find out the command to open the program, e.g. `thunderbird`.
5. Insert the launch command as a string for the variable `launch` in the script.
6. Make the script the way to open the desired program, e.g. by defining a custom keyboard shortcut or adding an entry in the kickoff menu or task bar (you can find instructions for this on the web).

### 2. Programs that prefer opening files in an existing window or raise existing other windows

With the script `open_firefox_on_current_desktop.sh`:

1. Find out the window class of the program: Open an instance of the program, run `wmctrl -l -x ` in a terminal, and get the window class name from the third column, e.g. `Navigator.firefox` or `atom.Atom`.
2. Insert the window class as a string for the variable `win_class` in the script.
3. Find out the command to open the file in a new window, e.g. `firefox -new-window` or `atom -n`.
4. Insert the launch-new command as a string for the variable `launch_new` in the script.
5. Find out the command to open the file in an existing window, e.g. `firefox -new-tab` or `atom`.
6. Insert the launch-existing command as a string for the variable `launch_old` in the script.
7. Make the script the application to open the desired file types: *System Settings* > *Applications* > *File Associations* or *Default Applications* > select relevant file types > add the path to the script and make it the top preference.

   

## Small Print

This work is licensed under the GNU General Public License v3.0.  
This program comes with absolutely no warranty.  
This is free software, and you are welcome to redistribute and/or modify it under certain conditions.  

© 2021 Natalie Clarius \<natalie_clarius@yahoo.de\>


If you would like to thank me, you can make me happy by [buying me a tea](https://www.buymeacoffee.com/nclarius).


# Open Project in IDE

Shell script and instructions to open a source code project in an IDE from the file manager.



## Installation

1. Download the script: GitHub repository > green top right button *Code* > *Download ZIP* > unpack > extract this folder.
3. Make the script executable: right-click on the `.sh` file > *Properties* > *Permissions* > checkbox *Is executable*.



## Set-up

1. Find out the command to open your IDE and insert it for `pycharm`.
2. In each directory where you want to open a source code project in an IDE from the file manager, create an empty file `directoryname.fileending`, where `directoryname` is the name of the project folder and `fileending` is a custom file ending, e.g. `.pycp` for ‘PyCharm project’.
3. Make `open_pycharm_project.sh` the application to open the custom file type: *System Settings* > *Applications* > *File Associations* or *Default Applications* > select relevant file type > add the path to `open_pycharm_project.sh` and make it the top preference.



## Usage

To open the project in the IDE, click on the `directoryname.fileending` file.



## Small Print

© 2021 Natalie Clarius \<natalie_clarius@yahoo.de\>

This work is licensed under the GNU General Public License v3.0.  
This program comes with absolutely no warranty.  
This is free software, and you are welcome to redistribute and/or modify it under certain conditions.  

If you would like to thank me, you can always make me happy with a cup of coffee:  
<a href="https://www.paypal.com/donate/?hosted_button_id=7LUUJD83BWRM4"><img src="https://www.paypalobjects.com/en_US/DK/i/btn/btn_donateCC_LG.gif" height="35"/></a>&nbsp;&nbsp;<a href="https://www.buymeacoffee.com/nclarius"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="35"/></a>



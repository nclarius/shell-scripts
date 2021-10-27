# Task Manager Modified

This is a modification of KDE’s [task manager applet](https://github.com/KDE/plasma-desktop/tree/master/applets/taskmanager) with a bunch of dirty hacks to:

- make it properly centrable (the original has some protruding space causing the entries to be shifted off-center)
- strip the labels down to bare file names (in particular, remove application names)
- center the labels in the entry and elide (…) long labels in the middle instead of the end
- add more window controls in the tool tip
- restore the behavior of previous versions where hovering an entry shows a semi-translucent full-screen preview of the window, and remove the small thumbnails
- abuse the “switch to x-th window” function to enable cycling windows in the order in which they appear in the task bar
- dim labels of inactive tasks for better contrast with the active task
- and possibly some other small cosmetic changes I forgot to list.

You can diff my fork against the main branch and cherry-pick your own combination with the changes you’d like to have.

![screenshot](screenshot.png)

## Installation

1. Download: GitHub repo > green top right button *Code* > *Download ZIP* > unpack and extract the `task-manager-modified` folder

2. Install the package: Open a terminal in the `task-manager-modified` folder and run 

   ````bash
   kpackagetool5 -t Plasma/Applet --install package
   ````

   (of if you made changes after already having installed it, use the `–-upgrade` option instead)

3. Restart Plasma:

   ````
   plasmashell --replace &&
   ````

4. Add the modified version to your panel: right-click on panel > *Edit panel* > *Add widgets …* > select *Task Manager Classic Modified*


# Modfifier-only shortcuts

Shell script to make modifier keys in isolation trigger certain actions; here: press meta key in isolation to toggle open/close KRunner.

## Set-up

1. make the script executable:
   richt-click on the `.sh` file > *Properties* > *Permissions* > checkbox *Is executable*

2. add custom shortcut:
   *System Settings* > *Shortcuts* > *Custom Shortcuts* > *Edit* > *New* > *Global Shortcut* > *Command/URL*

   - *Name*: ‘toggle KRunner’
   - *Comment*: ‘toggle KRunner’
   - *Trigger*: some shortcut of your choice e.g. *Meta+Esc*
   - *Action*: ‘sh /path_to_the_script/toggle_krunner.sh’

3. find UID of shortcut:
   in `~/.config/khotkeysrc`

   - search for ’KRunner', get section name `[Data_n]`, e.g. `[Data_8]`
   - get Uuid from section `[Data_n_Triggers0]`, e.g. `{64d38c94-2342-424a-a782-1139f1e4ca59}`

4. set modifier-only shortcut:
   edit ``~/.config/.kwincr`:

       ```
   ...
   [ModifierOnlyShortcuts]
   ...
   Meta=org.kde.kglobalaccel,/component/khotkeys,org.kde.kglobalaccel.Component,invokeShortcut,{Uuid}
   ...
       ```

   with the Uuid inserted into the curly braces.



## Usage

Press a modifier-only key, e.g. Meta.



## Small Print

This work is licensed under the GNU General Public License v3.0.  
This program comes with absolutely no warranty.  
This is free software, and you are welcome to redistribute and/or modify it under certain conditions.  

© 2021 Natalie Clarius \<natalie_clarius@yahoo.de\>


If you would like to thank me, you can make me happy by [buying me a tea](https://www.buymeacoffee.com/nclarius).


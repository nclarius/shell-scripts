# Modfifier-Only Shortcuts

Shell script and instructions to make modifier keys (Ctrl, Alt, Meta, ...) in isolation trigger certain actions; here: press meta key to toggle open/close KRunner.

## Set-up

1. Make the script executable:
   Right-click on the `.sh` file > *Properties* > *Permissions* > checkbox *Is executable*.

2. Add a custom shortcut:
   *System Settings* > *Shortcuts* > *Custom Shortcuts* > *Edit* > *New* > *Global Shortcut* > *Command/URL*.

   - *Name*: ‘toggle KRunner’
   - *Comment*: ‘toggle KRunner’
   - *Trigger*: some shortcut of your choice e.g. *Meta+Esc*
   - *Action*: ‘sh /path_to_the_script/toggle_krunner.sh’

3. Get the UID of the shortcut:
   in `~/.config/khotkeysrc`

   - Search for ’KRunner', get section name `[Data_n]`, e.g. `[Data_8]`.
   - Get the Uuid from the section `[Data_n_Triggers0]`, e.g. `{64d38c94-2342-424a-a782-1139f1e4ca59}`.

4. Set the modifier-only shortcut:
   edit ``~/.config/.kwincr`:

   ````
   ...
   [ModifierOnlyShortcuts]
   ...
   Meta=org.kde.kglobalaccel,/component/khotkeys,org.kde.kglobalaccel.Component,invokeShortcut,{Uuid}
   ...
   ````

   with your preferred modifier key as the assigneee and the Uuid inserted into the curly braces.



## Usage

Press the modifier-only key, e.g. Meta.



## Small Print

© 2021 Natalie Clarius \<natalie_clarius@yahoo.de\>

This work is licensed under the GNU General Public License v3.0.  
This program comes with absolutely no warranty.  
This is free software, and you are welcome to redistribute and/or modify it under certain conditions.  

If you would like to thank me, you can always make me happy with a cup of coffee:  
<a href="https://www.paypal.com/donate/?hosted_button_id=7LUUJD83BWRM4"><img src="https://www.paypalobjects.com/en_US/DK/i/btn/btn_donateCC_LG.gif" height="35"/></a>&nbsp;&nbsp;<a href="https://www.buymeacoffee.com/nclarius"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="35"/></a>


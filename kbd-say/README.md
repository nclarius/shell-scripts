# kbdsay

Silly program to show a message by lighting up keys on the keyboard, for
keyboards that support per-key backlight control via the sysfs.

![image](screenshot.gif)

## Setup

To use the script, you need to figure out and specify in the script which led
devices belong to which key character, by playing around with the files in 
`/sys/class/leds/\*kbd_backlight*/`. The identifier used is the number suffix of
the device name, e.g. `59` for ` rgb:kbd_backlight_59`. You can use the `
keymap.sh` helper script to walk through each led and see which key lights up.
The script uses white/black color for RGB keyboards; if you want to use
maximum/minimum brightness instead, replace the file name `multi_intensity` by `
brightness` and the RGB values by an appropriate brightness according to `
max_brightness`. You may also adjust the brightness/color and the speed in the
script to your preference.

## Usage

```
sh ./kbdsay.sh "hello world"
```
The script works by writing to files in the root file system. Use at your own
risk.

## Small Print

© 2024 Natalie Clarius \<natalie_clarius@yahoo.de>

This work is licensed under the GNU General Public License v3.0.

This program comes with absolutely no warranty.

This is free software, and you are welcome to redistribute and/or modify it
under certain conditions.

If you would like to thank me, you can always make me happy with a cup of
coffee:

![image](https://www.paypalobjects.com/en_US/DK/i/btn/btn_donateCC_LG.gif)


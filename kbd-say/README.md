# kbdsay

Silly program to show a text by lighting up keys on the keyboard, for keyboards that support per-key backlight control via the sysfs.

## Setup

To use the script, you need to figure out and specify in the script which led devices belong to which key character, by playing around with the `brightness` files in `/sys/class/leds/*kbd_backlight*/`. The identifier used is the number suffix of the device name, e.g. `53` for `rgb:kbd_backlight_53`. You may need to adjust the maxiumum brightness value in the script as well.

## Usage

Turn off all your keyboard backlights, then
```
kbdsay "Hello world"
```

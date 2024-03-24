#!/bin/bash

files=$(ls -1v /sys/class/leds/*kbd_backlight*/multi_intensity)
for f in $files; do
    echo "$f"
    echo "255 255 255" | sudo tee "$f"
    sleep 1
    echo "0 0 0" | sudo tee "$f"
done

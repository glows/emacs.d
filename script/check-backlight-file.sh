#!/bin/sh
if [ -w "/sys/class/backlight/intel_backlight/brightness" ]; then
    echo "t"
fi

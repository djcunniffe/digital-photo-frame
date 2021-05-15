#!/bin/bash

echo "Turning display on"

tvservice -p
export DISPLAY=:0
/home/pi/Scripts/set_display_timeout.sh

echo "Display turned on"

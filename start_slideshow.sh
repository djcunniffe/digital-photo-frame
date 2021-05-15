#!/bin/bash

echo "Starting slideshow"
cd /home/pi/Pictures
feh -Y -x -q -D 5 -B black -F -Z -z -r -R 60 --auto-rotate
echo "Slideshow started"

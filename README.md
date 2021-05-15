# digital-photo-frame
A raspberry pi digital photo frame

## Set-up
Note, the following assumes you are using the default `pi` user and have added these scripts to a `/home/pi/Scripts` folder.

Add the following to the end of your `~/.bashrc` file to allow the dsiplay to be controlled over SSH (useful for troubleshooting)

```
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	export DISPLAY=:0
fi
```
Add the follow to `/etc/profile` before the final `exit 0` line

```
# Run script to set display timeout to 0
/home/pi/Scripts/set_display_timeout.sh
# Run script to start slideshow as forked process
/home/pi/Scripts/start_slideshow.sh
```

Make sure all the scripts are executable
```
sudo chmod +x start_slideshow.sh
sudo chmod +x set_display_timeout.sh
sudo chmod +x turn_on_display.sh
sudo chmod +x turn_off_display.sh
```

To have the display turn on and off on a regular interval, I added the relevent script to a cronjob eg turning off at 22:00 and on at 07:00:
```
0 22 * * * /home/pi/Scripts/turn_off_display.sh
0 07 * * * /home/pi/Scripts/turn_on_display.sh
```

## To Do

1. Add a python script to periodically refresh the available pictures from a Google Drive folder
2. Automate the turning on and off of the display with Home Assistant (so it turns off when I'm not home) possibly through MQTT

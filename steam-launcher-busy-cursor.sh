#!/bin/bash
#requirements: sudo apt install feh

#To use this script - 
#1. Copy the steam.jpg to your ~/Pictures folder
#2. Right click the script->Properties and provide execute permissions
#3. Right click the default Steam launcher (on the desktop or start menu entry) and select properties.
#    Modify the 'Command' line to "bash /path/to/steam-launcher-busy-cursor.sh"
#4. Open launcher now to run Steam.

#set busy mouse pointer 
xsetroot -cursor_name watch

#display Steam loading pic using 'feh'
feh -x ~/Pictures/steam.jpg &
PID=$!

#launch steam
/usr/bin/steam "$@" &

#loop to wait for steam GUI window to open

# `wmctrl -l` outputs 4 "fields", separated by one or more spaces, but window
# names (the last field) may also contain spaces. We use awk to match the 4th
# field exactly to "Steam" _and_ check that the number of fields is exactly 4.
# awk always returns 0 normally, so we counter-intuitively return non-zero to
# indicate a match.
#
# Basically, the while command will repeat until a window named exactly "Steam"
# is found and awk returns 1, ending the loop.
# Thanks to Steam Linux user Mr ]"[ for suggesting this method rather than plain grep.
while wmctrl -l | awk '$4 ~ /^Steam$/ {if(NF==4){exit 1}}'; do
	sleep 1
done

#set normal mouse pointer
xsetroot -cursor_name left_ptr

#terminate 'feh'
kill $PID


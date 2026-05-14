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
/usr/bin/steam %U &
#loop to wait for steam GUI window to open
RETVAL=0
while [ $RETVAL -eq 0 ];
do
    sleep 1
    wmctrl -l > /tmp/stlbc.txt
    RETVAL=$(grep -c Steam /tmp/stlbc.txt)
done
#set normal mouse pointer
xsetroot -cursor_name left_ptr
#terminate 'feh'
kill $PID


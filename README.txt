The steam client on linux for Linux Mint (and probably other GNOME desktops)
provides a launcher which when opened does not provide any kind of visual feedback
or even a busy mouse pointer indicating that the steam client is in the process
of loading or opening. This is very confusing for users especially new linux gamers
who expect some visual feedback, leading to repeatedly double clicking the launcher.

To avoid this, a bash script workaround has been provided which displays a splash screen
and busy mouse cursor until the actual Steam window opens.

To use this script - 
1. Install 'feh' using "sudo apt install feh" or any software/package manager.
2. Copy the steam.jpg to your ~/Pictures folder
3. Right click the script->Properties and provide execute permissions
4. Right click the default Steam launcher (on the desktop or start menu entry) and select properties.
    Modify the 'Command' line to "bash /path/to/steam-launcher-busy-cursor.sh"
5. Close all windows and run the launcher now to run Steam.

Feel free to modify the script or the jpeg file as you see fit.


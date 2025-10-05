#!/bin/bash

# Always show an icon (safe output)
echo "⏻ "

# If clicked, open a simple power menu using rofi
if [ "$BLOCK_BUTTON" = "1" ]; then
    choice=$(printf "Lock\nLogout\nReboot\nShutdown" | rofi -dmenu -i -p "Power")

    case "$choice" in
    Lock) 
        i3-msg -q exec "i3lock -i ~/.config/wallpaper.jpg --blur 5 --clock --indicator"
        ;;
    Logout) 
        i3-msg exit 
        ;;
    Reboot) 
        systemctl reboot 
        ;;
    Shutdown) 
        systemctl poweroff 
        ;;
esac

fi

exit 0

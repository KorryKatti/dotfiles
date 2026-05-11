#!/bin/sh
# Power menu for Kanagawa setup
MENU="Lock\nLogout\nSleep\nReboot\nShutdown"
CHOICE=$(printf "$MENU" | fuzzel --dmenu -p "Power: ")

case "$CHOICE" in
    Lock) swaylock -f -c 1F1F28 ;;
    Logout) riverctl exit ;;
    Sleep) loginctl suspend ;;
    Reboot) loginctl reboot ;;
    Shutdown) loginctl poweroff ;;
esac

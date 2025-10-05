#!/bin/bash

# Battery device
BAT="BAT0"

# Check if battery exists
if [ ! -d "/sys/class/power_supply/$BAT" ]; then
    echo "No battery"
    exit 0
fi

# Read capacity and status
CAPACITY=$(cat /sys/class/power_supply/$BAT/capacity)
STATUS=$(cat /sys/class/power_supply/$BAT/status)

# Choose icon
if [ "$STATUS" = "Charging" ]; then
    ICON="⚡"
elif [ "$CAPACITY" -ge 80 ]; then
    ICON="🔋"
elif [ "$CAPACITY" -ge 30 ]; then
    ICON="🔋"
else
    ICON="🪫"
fi

# Output for i3blocks
echo "$ICON $CAPACITY%"

# Send low battery notification if below 30% and not charging
if [ "$CAPACITY" -lt 30 ] && [ "$STATUS" != "Charging" ]; then
    notify-send -u critical "Battery Low" "Battery at ${CAPACITY}%" -t 5000
fi

#!/bin/bash

# Your Codeforces handle
HANDLE="korrykatti"

# File to store last rating
STATE_FILE="$HOME/.config/i3blocks/codeforces_last"

# Fetch user info
DATA=$(curl -s "https://codeforces.com/api/user.info?handles=$HANDLE")
RATING=$(echo "$DATA" | jq -r '.result[0].rating')
RANK=$(echo "$DATA" | jq -r '.result[0].rank')

# Determine rating change
LAST=0
if [ -f "$STATE_FILE" ]; then
    LAST=$(cat "$STATE_FILE")
fi

# Save current rating for next tick
echo "$RATING" > "$STATE_FILE"

if [ "$LAST" -gt 0 ]; then
    if [ "$RATING" -gt "$LAST" ]; then
        ARROW="↑"
    elif [ "$RATING" -lt "$LAST" ]; then
        ARROW="↓"
    else
        ARROW="→"
    fi
else
    ARROW=""
fi

# Assign color by rating tier
if [ "$RATING" -lt 1200 ]; then
    COLOR="#808080"    # gray
elif [ "$RATING" -lt 1400 ]; then
    COLOR="#008000"    # green
elif [ "$RATING" -lt 1600 ]; then
    COLOR="#03A89E"    # cyan
elif [ "$RATING" -lt 1900 ]; then
    COLOR="#0000FF"    # blue
elif [ "$RATING" -lt 2100 ]; then
    COLOR="#AA00AA"    # violet
elif [ "$RATING" -lt 2300 ]; then
    COLOR="#FF8C00"    # orange
elif [ "$RATING" -lt 2400 ]; then
    COLOR="#FF0000"    # red
else
    COLOR="#FFD700"    # gold
fi

# Output for i3blocks
echo "CF: $RANK $ARROW ($RATING)"
echo "$COLOR"

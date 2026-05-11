#!/bin/sh

# Function to get metadata or return empty
get_metadata() {
    if playerctl status >/dev/null 2>&1; then
        playerctl metadata --format "text|string|{{artist}} - {{title}}"
    else
        echo "text|string|"
    fi
    echo ""
}

# 1. Send initial state
get_metadata

# 2. Listen for changes
# We use --follow but also handle the case where the player closes
playerctl metadata --format "text|string|{{artist}} - {{title}}" --follow 2>/dev/null | while read -r line; do
    echo "$line"
    echo ""
done

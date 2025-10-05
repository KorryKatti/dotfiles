#!/bin/bash

# File to cache the quote
CACHE="$HOME/.cache/zenquote.txt"

# Update interval in seconds (3600 = 1 hour)
INTERVAL=3600

# If cache doesn't exist or is older than INTERVAL, fetch new quote
if [ ! -f "$CACHE" ] || [ $(($(date +%s) - $(stat -c %Y "$CACHE"))) -gt $INTERVAL ]; then
    # Fetch new quote — only the text, no author
    QUOTE=$(curl -s https://zenquotes.io/api/random | jq -r '.[0].q')
    echo "$QUOTE" > "$CACHE"
fi

# Read cached quote
QUOTE=$(cat "$CACHE")

# Output for i3blocks — keep your emoji if needed
echo " $QUOTE"

#!/bin/bash

# File to cache the quote
CACHE="$HOME/.cache/zenquote.txt"

# Update interval in seconds (3600 = 1 hour)
INTERVAL=3600

fetch_quote() {
    curl -s https://zenquotes.io/api/random | jq -r '.[0].q'
}

# If cache doesn't exist, is too old, or quote is too long → get new one
if [ ! -f "$CACHE" ] || \
   [ $(($(date +%s) - $(stat -c %Y "$CACHE"))) -gt $INTERVAL ]; then
    QUOTE=$(fetch_quote)
    echo "$QUOTE" > "$CACHE"
else
    QUOTE=$(cat "$CACHE")
    # If length > 60, refetch
    if [ ${#QUOTE} -gt 60 ]; then
        QUOTE=$(fetch_quote)
        echo "$QUOTE" > "$CACHE"
    fi
fi

# Output for i3blocks
echo " $QUOTE"


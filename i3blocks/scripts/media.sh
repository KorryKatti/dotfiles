#!/bin/bash

# Get status of any MPRIS player
STATUS=$(playerctl status 2>/dev/null)

# Exit if no player running
if [ -z "$STATUS" ]; then
    echo ""
    exit 0
fi

# Get artist, title, album, and player name
ARTIST=$(playerctl metadata artist 2>/dev/null)
TITLE=$(playerctl metadata title 2>/dev/null)
ALBUM=$(playerctl metadata album 2>/dev/null)
PLAYER=$(playerctl metadata mpris:trackid 2>/dev/null)

# Choose icon per player
case "$PLAYER" in
    *spotify*) ICON="🎵" ;;
    *vlc*)     ICON="🎬" ;;
    *mpd*)     ICON="🎶" ;;
    *)         ICON="🎼" ;;
esac

# Icon based on status
if [ "$STATUS" = "Playing" ]; then
    STATE_ICON="▶️"
elif [ "$STATUS" = "Paused" ]; then
    STATE_ICON="⏸️"
else
    STATE_ICON="⏹️"
fi

# Get position and duration for progress bar
POS=$(playerctl position 2>/dev/null)
DUR=$(playerctl metadata mpris:length 2>/dev/null)
if [ -n "$POS" ] && [ -n "$DUR" ] && [ "$DUR" -gt 0 ]; then
    PROGRESS_LENGTH=8
    FILLED=$(( POS * PROGRESS_LENGTH / (DUR / 1000000) )) # convert µs to seconds
    BAR=""
    for ((i=0;i<PROGRESS_LENGTH;i++)); do
        if [ $i -lt $FILLED ]; then
            BAR+="■"
        else
            BAR+="□"
        fi
    done
else
    BAR=""
fi

# Output for i3blocks
echo "$ICON $STATE_ICON $TITLE — $ARTIST $BAR"

# Click handling
case "$BLOCK_BUTTON" in
    1) playerctl next ;;         # Left click → next track
    2) playerctl play-pause ;;   # Middle click → play/pause
    3) playerctl previous ;;     # Right click → previous track
    4) playerctl volume 0.05+ ;; # Scroll up → volume up
    5) playerctl volume 0.05- ;; # Scroll down → volume down
esac

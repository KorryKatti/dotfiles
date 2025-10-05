#!/bin/bash

# Get status of any MPRIS player
STATUS=$(playerctl status 2>/dev/null)

# Exit if no player running
if [ -z "$STATUS" ]; then
    echo ""
    exit 0
fi

# Get artist, title
ARTIST=$(playerctl metadata artist 2>/dev/null)
TITLE=$(playerctl metadata title 2>/dev/null)

# Combine title + artist
DISPLAY_TEXT="$TITLE — $ARTIST"

# Truncate if longer than 60 chars
MAX_LENGTH=60
if [ ${#DISPLAY_TEXT} -gt $MAX_LENGTH ]; then
    DISPLAY_TEXT="${DISPLAY_TEXT:0:$MAX_LENGTH}…"
fi

# Player icon detection
PLAYER=$(playerctl metadata mpris:trackid 2>/dev/null)
case "$PLAYER" in
    *spotify*) ICON="🎵" ;;
    *vlc*)     ICON="🎬" ;;
    *mpd*)     ICON="🎶" ;;
    *)         ICON="🎼" ;;
esac

# Status icon
case "$STATUS" in
    "Playing") STATE_ICON="▶️" ;;
    "Paused") STATE_ICON="⏸️" ;;
    *)         STATE_ICON="⏹️" ;;
esac

# Progress bar
POS=$(playerctl position 2>/dev/null)
DUR=$(playerctl metadata mpris:length 2>/dev/null)
if [ -n "$POS" ] && [ -n "$DUR" ] && [ "$DUR" -gt 0 ]; then
    PROGRESS_LENGTH=8
    FILLED=$(( POS * PROGRESS_LENGTH / (DUR / 1000000) ))
    BAR=""
    for ((i=0;i<PROGRESS_LENGTH;i++)); do
        if [ $i -lt $FILLED ]; then BAR+="■"; else BAR+="□"; fi
    done
else
    BAR=""
fi

# Output for i3blocks
echo "$ICON $STATE_ICON $DISPLAY_TEXT $BAR"

# Click handling
case "$BLOCK_BUTTON" in
    1) playerctl next ;;         # Left click → next track
    2) playerctl play-pause ;;   # Middle click → play/pause
    3) playerctl previous ;;     # Right click → previous track
    4) playerctl volume 0.05+ ;; # Scroll up → volume up
    5) playerctl volume 0.05- ;; # Scroll down → volume down
esac


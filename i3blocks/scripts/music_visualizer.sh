#!/bin/bash
# Music visualizer only when audio is playing

CONFIG="$HOME/.config/i3blocks/cava_config"

# Get current audio volume from pulseaudio
VOLUME=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n1 | awk '{print $5}' | tr -d '%')

# Show visualizer only if volume > 0
if [ "$VOLUME" -eq 0 ]; then
    echo ""
    exit 0
fi

# Music is playing → capture cava output
VIS=$(cava -p "$CONFIG" -b block -s -f 1 | tail -n1)

# Only output if valid
if [[ "$VIS" =~ [▂▃▄▅▆▇█] ]]; then
    echo "🎵 $VIS"
else
    echo ""
fi

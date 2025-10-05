#!/bin/bash
# Simple cava-based visualizer for i3blocks

# Capture last line from cava output
VIS=$(cava -p ~/.config/i3blocks/cava_config -b block -s -f 1 | tail -n1)

# Output for i3blocks
echo "🎵 $VIS"

#!/bin/bash

# Set your city
CITY="Panaji"  # <-- change to your preferred city

# Fetch weather symbol + temperature from wttr.in
WEATHER=$(curl -s "wttr.in/${CITY}?format=%c+%t" 2>/dev/null)

# Output for i3blocks
echo "$WEATHER"

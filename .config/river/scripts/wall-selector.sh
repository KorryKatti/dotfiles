#!/usr/bin/env sh

# Path to your wallpaper folder
WALL_DIR="$HOME/Pictures/Wallpapers"
# File to store the current wallpaper path
WALL_CACHE="$HOME/.cache/current_wallpaper"

# 1. Select wallpaper
SELECTED=$(ls "$WALL_DIR" | fuzzel --dmenu --prompt " 🌊 Select Wallpaper: ")



# Exit if nothing was selected
[ -z "$SELECTED" ] && exit 0

FULL_PATH="$WALL_DIR/$SELECTED"

# 2. Save the path for next time (so your init script can find it)
echo "$FULL_PATH" > "$WALL_CACHE"

# 3. Kill the old swaybg and start the new one
pkill swaybg
swaybg -i "$FULL_PATH" -m fill &

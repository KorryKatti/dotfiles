#!/bin/sh

# Get current wallpaper from your cache
WALL=$(cat "$HOME/.cache/current_wallpaper")

swaylock \
  --screenshots \
  --clock \
  --indicator \
  --indicator-radius 100 \
  --indicator-thickness 7 \
  --effect-blur 7x5 \
  --effect-vignette 0.5:0.5 \
  --ring-color 7E9CD8 \
  --key-hl-color 98BB6C \
  --bg-color 1F1F28 \
  --line-color 00000000 \
  --inside-color 1F1F2888 \
  --separator-color 00000000 \
  --text-color DCD7BA

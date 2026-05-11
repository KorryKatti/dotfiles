#!/usr/bin/env sh

# Get the list of notifications from makoctl and format them for fuzzel
# We use makoctl history to get the JSON, then parse with simple tools
# If you don't have 'jq' installed, run: sudo xbps-install -S jq
SELECTED=$(makoctl history | jq -r '.data[0] | reverse | .[] | "\(.app_name.data): \(.summary.data)"' | fuzzel --dmenu --prompt "   Notifications: ")

# If you select one, you can make it do something, but for now, we just list them.
exit 0

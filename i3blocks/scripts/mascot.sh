#!/bin/bash

# Width of the “movement space” in the bar
WIDTH=1

# Array of ASCII poses
POSES=("(^_^)" "(¬_¬)" "(•_•)" "(>_<)" "(O_O)" "(^o^)" "(^_^;)" "(o_o)" "(T_T)" "(^_-)" "(˚Δ˚)b" "(╯°□°）╯︵ ┻━┻" "(^.^)" "<(o_o)>" "(;-;)" "(≥o≤)" "\\(^o^)/")

# Persistent file to track position and direction
STATE_FILE="$HOME/.config/i3blocks/mascot_state"

# Initialize if not exists
if [ ! -f "$STATE_FILE" ]; then
    echo "0 1" > "$STATE_FILE"  # pos=0, dir=1 (right)
fi

read POS DIR < "$STATE_FILE"

# Pick a random pose
POSE=${POSES[$((RANDOM % ${#POSES[@]}))]}

# Create spacing to simulate movement
SPACES=$(printf "%${POS}s" " ")

# Output the mascot with spaces
echo "${SPACES}${POSE}"

# Update position for next tick
POS=$((POS + DIR))
if [ $POS -le 0 ]; then
    DIR=1
elif [ $POS -ge $WIDTH ]; then
    DIR=-1
fi

# Save state
echo "$POS $DIR" > "$STATE_FILE"

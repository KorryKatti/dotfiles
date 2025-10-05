#!/bin/bash

# Show icon no matter what
echo "🚪"

# If clicked (left click = 1), perform action
if [ "$BLOCK_BUTTON" = "1" ]; then
    i3-msg exit
fi

exit 0

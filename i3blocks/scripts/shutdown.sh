#!/bin/bash
echo "⏻"

if [ "$BLOCK_BUTTON" = "1" ]; then
    systemctl poweroff
fi

exit 0

#!/bin/bash
echo "🔄"

if [ "$BLOCK_BUTTON" = "1" ]; then
    systemctl reboot
fi

exit 0


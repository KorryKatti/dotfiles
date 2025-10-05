#!/bin/bash

# Current date
NOW=$(date +%s)

# Start and end of the year
YEAR=$(date +%Y)
START=$(date -d "$YEAR-01-01" +%s)
END=$(date -d "$YEAR-12-31" +%s)

# Total seconds in year and seconds passed
TOTAL=$((END - START))
PASSED=$((NOW - START))

# Weeks remaining
WEEKS_LEFT=$(( (TOTAL - PASSED) / (7*24*60*60) + 1 ))

# Output for i3blocks
echo "📅 $WEEKS_LEFT weeks left"

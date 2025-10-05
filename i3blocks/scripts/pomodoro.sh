#!/bin/bash
# Fixed i3blocks Pomodoro timer with permanent stop

STATE_FILE="$HOME/.cache/pomodoro_state.txt"
WORK_DURATION=25   # minutes
SHORT_BREAK=5      # minutes
LONG_BREAK=15      # minutes
CYCLE=4            # long break every 4 cycles

WORK_SOUND="$HOME/.config/i3blocks/sounds/work.wav"
BREAK_SOUND="$HOME/.config/i3blocks/sounds/break.wav"

# Ensure state file exists
if [ ! -f "$STATE_FILE" ]; then
    echo "idle|0|0|0" > "$STATE_FILE" # STATE|END_TIMESTAMP|CYCLE_COUNT|PERM_STOP
fi

# Read state
read STATE END_TIME CYCLE_COUNT PERM_STOP < <(tr '|' ' ' < "$STATE_FILE")

CURRENT=$(date +%s)

# Handle clicks
if [ ! -z "$BLOCK_BUTTON" ]; then
    case "$BLOCK_BUTTON" in
        1) # left click: start/resume
            if [ "$STATE" = "idle" ] || [ "$STATE" = "paused" ]; then
                STATE="working"
                END_TIME=$((CURRENT + WORK_DURATION*60))
                PERM_STOP=0
            elif [ "$STATE" = "working" ] || [ "$STATE" = "break" ]; then
                STATE="paused"
            fi
            ;;
        2) # middle click: permanent stop
            STATE="idle"
            END_TIME=0
            PERM_STOP=1
            ;;
        3) # right click: reset
            STATE="idle"
            END_TIME=0
            CYCLE_COUNT=0
            PERM_STOP=0
            ;;
    esac
fi

# Countdown logic (skip if permanently stopped)
if [ "$PERM_STOP" -eq 0 ] && [ "$STATE" = "working" ] || [ "$STATE" = "break" ]; then
    REMAIN=$(( (END_TIME - CURRENT)/60 ))
    if [ $REMAIN -le 0 ]; then
        if [ "$STATE" = "working" ]; then
            CYCLE_COUNT=$((CYCLE_COUNT+1))
            if (( CYCLE_COUNT % CYCLE == 0 )); then
                STATE="break"
                END_TIME=$((CURRENT + LONG_BREAK*60))
            else
                STATE="break"
                END_TIME=$((CURRENT + SHORT_BREAK*60))
            fi
            notify-send "Pomodoro" "Break started!"
            [ -f "$BREAK_SOUND" ] && paplay "$BREAK_SOUND" &
        elif [ "$STATE" = "break" ]; then
            STATE="working"
            END_TIME=$((CURRENT + WORK_DURATION*60))
            notify-send "Pomodoro" "Work session started!"
            [ -f "$WORK_SOUND" ] && paplay "$WORK_SOUND" &
        fi
    fi
fi

# Build progress bar (10 segments)
TOTAL=$((STATE=="working"?WORK_DURATION:(STATE=="break"? (CYCLE_COUNT % CYCLE == 0 ? LONG_BREAK : SHORT_BREAK) : 1)))
FILLED=$((10 * (TOTAL - REMAIN)/TOTAL))
if [ $FILLED -lt 0 ]; then FILLED=0; fi
BAR=$(printf '█%.0s' $(seq 1 $FILLED))
BAR+=$(printf '▁%.0s' $(seq 1 $((10-FILLED))))

# Display
if [ "$STATE" = "idle" ]; then
    echo "🍅 Idle ▁▁▁▁▁▁▁▁▁▁"
elif [ "$STATE" = "paused" ]; then
    echo "⏸ $REMAIN min |$BAR|"
elif [ "$STATE" = "working" ]; then
    echo "🍅 $REMAIN min |$BAR|"
elif [ "$STATE" = "break" ]; then
    echo "☕ $REMAIN min |$BAR|"
fi

# Save state
echo "$STATE|$END_TIME|$CYCLE_COUNT|$PERM_STOP" > "$STATE_FILE"

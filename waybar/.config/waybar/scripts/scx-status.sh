#!/bin/bash

# Get raw data from scxctl
DATA=$(scxctl get 2>/dev/null)

# If scx_loader isn't running, exit silently or show "Off"
if [ -z "$DATA" ]; then
    echo "{\"text\": \"󰓅 SCX: Off\", \"class\": \"disabled\"}"
    exit 0
fi

# Extract Scheduler and Mode
SCHED=$(echo "$DATA" | grep 'Scheduler:' | awk '{print $2}')
MODE=$(echo "$DATA" | grep 'Mode:' | awk '{print $2}')

# Set an icon or color class based on the mode
case "$MODE" in
    "Gaming")    ICON="󰓓" ; CLASS="gaming" ;;
    "PowerSave") ICON="󰌪" ; CLASS="powersave" ;;
    "Auto")      ICON="󰓅" ; CLASS="auto" ;;
    *)           ICON="󰒎" ; CLASS="other" ;;
esac

# Output JSON for Waybar
echo "{\"text\": \"$ICON $SCHED ($MODE)\", \"tooltip\": \"Current: $SCHED\nMode: $MODE\n\nClick: Cycle Mode\nRight-Click: Restart Scheduler\", \"class\": \"$CLASS\"}"

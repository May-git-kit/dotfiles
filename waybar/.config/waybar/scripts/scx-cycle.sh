#!/bin/bash
# Get current scheduler and mode
CURRENT_SCHED=$(scxctl get | grep 'Scheduler:' | awk '{print $2}')
CURRENT_MODE=$(scxctl get | grep 'Mode:' | awk '{print $2}')

# Define the rotation: Auto -> Gaming -> PowerSave -> LowLatency -> Auto
case "$CURRENT_MODE" in
    "Auto")          NEXT="Gaming" ;;
    "Gaming")        NEXT="PowerSave" ;;
    "PowerSave")     NEXT="LowLatency" ;;
    *)               NEXT="Auto" ;;
esac

# Execute the switch
scxctl switch "$CURRENT_SCHED" --mode "$NEXT"

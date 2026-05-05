#!/bin/bash
# Calculates disk read/write speeds from sysfs

DEVICE="nvme0n1"
STAT_FILE="/sys/block/$DEVICE/stat"

if [[ ! -f "$STAT_FILE" ]]; then
    echo "0B"
    exit 0
fi

# Read initial stats
read -r -a stats1 < "$STAT_FILE"
sleep 1
# Read stats again
read -r -a stats2 < "$STAT_FILE"

# stats[2] = sectors read, stats[6] = sectors written (512 bytes per sector)
if [[ "$1" == "read" ]]; then
    sectors=$(( stats2[2] - stats1[2] ))
elif [[ "$1" == "write" ]]; then
    sectors=$(( stats2[6] - stats1[6] ))
else
    echo "0B"
    exit 0
fi

bytes=$(( sectors * 512 ))

# Convert to human-readable format
if [[ $bytes -ge 1048576 ]]; then
    echo "$(( bytes / 1048576 ))M"
elif [[ $bytes -ge 1024 ]]; then
    echo "$(( bytes / 1024 ))K"
else
    echo "${bytes}B"
fi

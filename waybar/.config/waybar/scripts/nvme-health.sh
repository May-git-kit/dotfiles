#!/bin/bash
# Gets NVMe health percentage

# Requires sudo privileges for nvme-cli
used=$(sudo nvme smart-log /dev/nvme0n1 2>/dev/null | grep "percentage_used" | awk -F ':' '{print $2}' | tr -d ' %')

if [[ -n "$used" ]]; then
    health=$((100 - used))
    echo "$health"
else
    echo "N/A"
fi

#!/bin/sh

# Get the number of updates from Arch and AUR
updates_arch=$(checkupdates 2> /dev/null | wc -l)
updates_aur=$(paru -Qua 2> /dev/null | wc -l)

# Calculate total updates
updates=$((updates_arch + updates_aur))

# Output the icon and number of updates if there are any
if [ "$updates" -gt 0 ]; then
    echo "$updates"
else
    echo "0"
fi


#!/bin/sh


# Get the number of updates from Arch and AUR
updates_arch=$(checkupdates 2> /dev/null | wc -l)
updates_aur=$(yay -Qum 2> /dev/null | wc -l)

# Handle cases where checkupdates or yay might fail
if [ -z "$updates_arch" ]; then
    updates_arch=0
fi
if [ -z "$updates_aur" ]; then
    updates_aur=0
fi

# Calculate total updates
updates=$((updates_arch + updates_aur))

# Output the icon and number of updates if there are any
if [ "$updates" -gt 0 ]; then
    echo "$updates"
else
    echo "0"
fi


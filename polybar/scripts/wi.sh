#!/usr/bin/env bash

# Check if nmcli is installed
if ! command -v nmcli &> /dev/null; then
    echo "󰖪 "  # Wi-Fi disabled icon as fallback
    exit 0
fi

# Check Wi-Fi status
wifi_status=$(nmcli -t -f WIFI g)
if [[ "$wifi_status" == "disabled" ]]; then
    echo "󰖪 "  # Wi-Fi disabled icon
    exit 0
fi

# Get the current signal strength
signal_strength=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '^*' | cut -d: -f2)

# Determine signal strength icon
if [ -z "$signal_strength" ]; then
    signal_icon="󰤮 "  # Wi-Fi is on but not connected to any network
elif [ "$signal_strength" -le 20 ]; then
    signal_icon="󰤯 "  # Weak signal icon
elif [ "$signal_strength" -le 40 ]; then
    signal_icon="󰤟 "  # Low signal icon
elif [ "$signal_strength" -le 60 ]; then
    signal_icon="󰤢 "  # Medium signal icon
elif [ "$signal_strength" -le 80 ]; then
    signal_icon="󰤥 "  # High signal icon
else
    signal_icon="󰤨 "  # Very high signal icon
fi

# Check connection status
connection_status=$(nmcli -t -f CONNECTIVITY g)
if [[ "$connection_status" != "full" && "$connection_status" != "limited" ]]; then
    echo "󰤮 "  # Disconnected icon
    exit 0
fi

# Check for packet loss
if ! ping -c 1 -W 1 8.8.8.8 &> /dev/null; then
    echo "󰤠 "  # Packet loss icon
    exit 0
fi

# Output the signal icon only
echo "$signal_icon"


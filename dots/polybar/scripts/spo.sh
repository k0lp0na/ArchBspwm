#!/bin/bash

# Function to get the current player status and title
get_player_info() {
    local player=$1
    local status=$(playerctl -p "$player" status 2> /dev/null)
    local title=$(playerctl -p "$player" metadata title 2> /dev/null)
    echo "$status|$title"
}

# Function to trim the title length
trim_title() {
    local title=$1
    local max_length=30
    if [ ${#title} -gt $max_length ]; then
        title="${title:0:$((max_length - 2))}.."
    fi
    echo "$title"
}

# Previous output to detect changes
prev_output=""

while true; do
    # Get all available players
    players=$(playerctl -l 2> /dev/null)

    active_player=""
    output=" 󰝚 "  # Default output if no players are active

    if [[ -n "$players" ]]; then
        for player in $players; do
            player_info=$(get_player_info "$player")
            status=$(echo "$player_info" | cut -d'|' -f1)
            title=$(echo "$player_info" | cut -d'|' -f2)

            if [[ "$status" == "Playing" ]]; then
                active_player="$player"
                output=$(trim_title "$title")
                break
            elif [[ "$status" == "Paused" && -z "$active_player" ]]; then
                active_player="$player"
                output=$(trim_title "$title")
            fi
        done

        if [[ -n "$active_player" ]]; then
            # Add the Spotify icon if Spotify is playing or paused
            if [[ "$active_player" == "spotify" ]]; then
                output="󰓇 $output"
            else
                output="󰝚 $output"
            fi
        else
            output=" 󰎇 music 󰎇 "
        fi
    else
        output=" 󰝚  "
    fi

    # Print the formatted output only if it has changed
    if [[ "$output" != "$prev_output" ]]; then
        echo "$output"
        prev_output="$output"
    fi

    # Sleep for a short interval before checking again
    sleep 1
done
 

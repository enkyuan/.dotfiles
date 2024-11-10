#!/usr/bin/env bash

# Detects if Spotify is running
if ! pgrep -f "Spotify" > /dev/null 2>&1; then
    open -a "/Applications/Spotify.app"
else
    # Create a new window
    script='tell application "Spotify" to create window with default profile'
    ! osascript -e "${script}" > /dev/null 2>&1 && {
        # Get pids for any app with "Spotify" and kill
        while IFS="" read -r pid; do
            kill -15 "${pid}"
        done < <(pgrep -f "Spotify")
       open -a "/Applications/Spotify.app"
    }
fi

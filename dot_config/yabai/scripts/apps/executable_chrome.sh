#!/usr/bin/env bash

# Detects if Chrome is running
if ! pgrep -f "Chrome" > /dev/null 2>&1; then
    open -a "/Applications/Chrome.app"
else
    # Create a new window
    script='tell application "Chrome" to create window with default profile'
    ! osascript -e "${script}" > /dev/null 2>&1 && {
        # Get pids for any app with "Chrome" and kill
        while IFS="" read -r pid; do
            kill -15 "${pid}"
        done < <(pgrep -f "Chrome")
       open -a "/Applications/Chrome.app"
    }
fi

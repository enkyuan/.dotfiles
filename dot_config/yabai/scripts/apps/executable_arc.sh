#!/usr/bin/env bash

# Detects if Arc is running
if ! pgrep -f "Arc" > /dev/null 2>&1; then
    open -a "/Applications/Arc.app"
else
    # Create a new window
    script='tell application "Arc" to create window with default profile'
    ! osascript -e "${script}" > /dev/null 2>&1 && {
        # Get pids for any app with "Arc" and kill
        while IFS="" read -r pid; do
            kill -15 "${pid}"
        done < <(pgrep -f "Arc")
        open -a "/Applications/Arc.app"
    }
fi

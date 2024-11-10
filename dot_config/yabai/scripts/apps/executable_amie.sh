#!/usr/bin/env bash

# Detects if Amie is running
if ! pgrep -f "Amie" > /dev/null 2>&1; then
    open -a "/Applications/Amie.app"
else
    # Create a new window
    script='tell application "Amie" to create window with default profile'
    ! osascript -e "${script}" > /dev/null 2>&1 && {
        # Get pids for any app with "Amie" and kill
        while IFS="" read -r pid; do
            kill -15 "${pid}"
        done < <(pgrep -f "Amie")
        open -a "/Applications/Amie.app"
    }
fi

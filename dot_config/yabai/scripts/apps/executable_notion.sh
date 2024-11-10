#!/usr/bin/env bash

# Detects if Notion is running
if ! pgrep -f "Notion" > /dev/null 2>&1; then
    open -a "/Applications/Notion.app"
else
    # Create a new window
    script='tell application "Notion" to create window with default profile'
    ! osascript -e "${script}" > /dev/null 2>&1 && {
        # Get pids for any app with "Notion" and kill
        while IFS="" read -r pid; do
            kill -15 "${pid}"
        done < <(pgrep -f "Notion")
       open -a "/Applications/Notion.app"
    }
fi

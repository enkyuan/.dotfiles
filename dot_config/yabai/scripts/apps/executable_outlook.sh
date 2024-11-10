#!/usr/bin/env bash

# Detects if Microsoft Outlook is running
if ! pgrep -f "Microsoft Outlook" > /dev/null 2>&1; then
    open -a "/Applications/Microsoft Outlook.app"
else
    # Create a new window
    script='tell application "Microsoft Outlook" to create window with default profile'
    ! osascript -e "${script}" > /dev/null 2>&1 && {
        # Get pids for any app with "Microsoft Outlook" and kill
        while IFS="" read -r pid; do
            kill -15 "${pid}"
        done < <(pgrep -f "Microsoft Outlook")
       open -a "/Applications/Microsoft Outlook.app"
    }
fi

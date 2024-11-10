 #!/usr/bin/env bash

# Detects if Discord is running
if ! pgrep -f "Discord" > /dev/null 2>&1; then
    open -a "/Applications/Discord.app"
else
    # Create a new window
    script='tell application "Discord" to create window with default profile'
    ! osascript -e "${script}" > /dev/null 2>&1 && {
        # Get pids for any app with "Discord" and kill
        while IFS="" read -r pid; do
            kill -15 "${pid}"
        done < <(pgrep -f "Discord")
       open -a "/Applications/Discord.app"
    }
fi

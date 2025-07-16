#!/bin/bash

open_chrome_tab_if_not_exists() {
  local targetURL="$1"

  osascript -e "
    tell application \"Google Chrome\"
      set found to false
      repeat with theWindow in windows
        repeat with theTab in tabs of theWindow
          if URL of theTab contains \"$targetURL\" then
            set found to true
            activate theTab
            activate theWindow
            exit repeat
          end if
        end repeat
        if found then exit repeat
      end repeat
      if not found then
        open location \"$targetURL\"
      end if
    end tell
  "
}

# Example usage:
if [ $# -eq 1 ]; then
  open_chrome_tab_if_not_exists "$1"
else
  echo "Usage: $0 <url>"
  exit 1
fi

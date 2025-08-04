#!/bin/bash

# This script intelligently finds the correct directory before running fzf.
TARGET_PANE="$1"

# Ask tmux for the path of the original pane and store it.
PANE_PATH=$(tmux display-message -p -t "$TARGET_PANE" '#{pane_current_path}')

# Change to the correct directory before running any commands.
cd "$PANE_PATH"

# Run fzf, finding ALL files and folders from the current path.
SELECTED_ITEM=$(find . | fzf)

# If an item was selected, send the formatted result back.
if [ -n "$SELECTED_ITEM" ]; then
    # Paste the "@" symbol followed by the selected item's path.
    tmux send-keys -t "$TARGET_PANE" "@$SELECTED_ITEM"
fi

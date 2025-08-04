#!/bin/bash

# Find the directory where this script is located.
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FZF_SCRIPT_PATH="$CURRENT_DIR/scripts/fzf_popup.sh"

# Helper function to get a tmux option or return a default value.
get_tmux_option() {
    local option_name="$1"
    local default_value="$2"
    local option_value=$(tmux show-options -gqv "$option_name")
    if [ -z "$option_value" ]; then
        echo "$default_value"
    else
        echo "$option_value"
    fi
}

# The key to open the fzf popup. Can be customized in .tmux.conf.
KEY_BINDING=$(get_tmux_option "@claude-fzf-key" "F")

# The command to run. It opens a popup in the current pane's directory.
COMMAND_TO_RUN="display-popup -E -c #{pane_current_path} 'bash $FZF_SCRIPT_PATH #{pane_id}'"

# Bind the key to the command.
tmux bind-key "$KEY_BINDING" "$COMMAND_TO_RUN"

# Display a confirmation message when the plugin loads.
tmux display-message "tmux-claude-fzf loaded. Press Prefix + $KEY_BINDING to open fzf."

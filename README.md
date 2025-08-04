# Tmux Claude FZF

A simple tmux plugin for quickly finding files or folders with `fzf` and pasting them as an `@mention` into the current pane. Ideal for providing file context to AI coding assistants directly within the terminal.

![demo](https://user-images.githubusercontent.com/username/repo/demo.gif)  ## Features

-   **Direct & Fast:** No background watchers. A single keypress instantly opens `fzf`.
-   **Context-Aware:** `fzf` always opens in the directory of your current tmux pane.
-   **Formatted Output:** Pastes the selected path prefixed with `@`, ready for AI consumption.

## Prerequisites

-   `tmux`
-   `fzf` (Install with `sudo apt install fzf` or `brew install fzf`)

## Installation with TPM

1.  Add the plugin to your list of TPM plugins in `.tmux.conf`:

    ```tmux
    set -g @plugin 'jkhas8/tmux-claude-fzf'
    ```

2.  Press `prefix + I` to fetch the plugin.

## Usage

1.  Navigate to your AI assistant's pane within a project directory.
2.  Press `prefix + F` (or your custom key).
3.  The `fzf` popup will appear, listing files and folders from your current directory.
4.  Select an item and press `Enter`.
5.  The path will be pasted into the pane as `@path/to/your/selection`.

## Configuration

You can customize the keybinding by adding this line to your `.tmux.conf` (before the `run .../tpm` line).

```tmux
# Set the custom key for the fzf popup to 'J'
set -g @claude-fzf-key 'J'
```

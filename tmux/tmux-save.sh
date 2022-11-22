#!/usr/bin/env bash
# Save and restore the state of tmux sessions and windows.
# TODO: persist and restore the state & position of panes.
set -e

# save session
d=$'\t'
tmux list-windows -a -F "#S${d}#W${d}#{pane_current_path}" > ~/.tmux-session

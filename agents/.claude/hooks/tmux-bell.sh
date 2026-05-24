#!/bin/sh
# Emit BEL into the Claude pane so tmux marks the window as needing attention.

set -eu

if [ -n "${TMUX_PANE:-}" ] && command -v tmux >/dev/null 2>&1; then
  pane_tty="$(tmux display-message -p -t "$TMUX_PANE" '#{pane_tty}' 2>/dev/null || true)"
  if [ -n "$pane_tty" ] && [ -w "$pane_tty" ]; then
    printf '\a' > "$pane_tty"
    exit 0
  fi
fi

if [ -w /dev/tty ]; then
  printf '\a' > /dev/tty 2>/dev/null || true
fi

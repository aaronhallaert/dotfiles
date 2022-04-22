#!/usr/bin/env sh
#
# Toggle the current window (all panes) between light and dark themes.
set -e

default_window_style='fg=default,bg=default'
default_window_status_current_style='fg=colour166,bg=default,bright'
default_window_status_style='fg=colour244,bg=default,dim'
default_status_style='bg=colour235,fg=colour136,default'

alternate_window_style='fg=#171421,bg=#ffffff'
alternate_window_status_current_style='fg=colour166,bg=#ffffff,bright'
alternate_window_status_style='fg=colour244,bg=#ffffff,dim'
alternate_status_style='bg=colour235,fg=#ffffff,default'

current_window_style=$(tmux show -Av window-style)

case $current_window_style in
    $default_window_style|'default')
        # Change to the alternate window style.
        tmux set window-style $alternate_window_style
        tmux set window-status-current-style $alternate_window_status_current_style
        tmux set window-status-style $alternate_window_status_style
        tmux set status-style $alternate_status_style
        ;;
    *)
        # Change back to the default window style.
        tmux set window-style $default_window_style
        tmux set window-status-current-style $default_window_status_current_style
        tmux set window-status-style $default_window_status_style
        tmux set status-style $default_status_style
        ;;
esac

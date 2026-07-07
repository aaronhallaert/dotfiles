#!/usr/bin/env bash

WAYBAR_DIR="$HOME/dotfiles/waybar/.config/waybar"
SWAYNC_DIR="$HOME/dotfiles/swaync/.config/swaync"

# nf-fa-sun_o U+F185, nf-fa-moon_o U+F186
SUN=$(printf '\xef\x86\x85')
MOON=$(printf '\xef\x86\x86')

current=$(readlink "$WAYBAR_DIR/theme.css" 2>/dev/null)

is_light() {
    [[ "$current" == "colors-light.css" || "$current" == *"colors-light.css" ]]
}

if [[ "$1" == "--status" ]]; then
    if is_light; then
        printf '{"text":"%s","tooltip":"Switch to dark","class":"light"}\n' "$MOON"
    else
        printf '{"text":"%s","tooltip":"Switch to light","class":"dark"}\n' "$SUN"
    fi
    exit 0
fi

if is_light; then
    ln -sf "$WAYBAR_DIR/colors-dark.css" "$WAYBAR_DIR/theme.css"
    ln -sf "$SWAYNC_DIR/colors-dark.css" "$SWAYNC_DIR/theme.css"
else
    ln -sf "$WAYBAR_DIR/colors-light.css" "$WAYBAR_DIR/theme.css"
    ln -sf "$SWAYNC_DIR/colors-light.css" "$SWAYNC_DIR/theme.css"
fi

pkill -SIGUSR2 waybar
PATH="/usr/local/bin:/usr/bin:/bin:$PATH" swaync-client --reload-css

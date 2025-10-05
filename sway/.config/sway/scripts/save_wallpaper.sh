#!/bin/sh

# the current wallpaper is stored in $WALLPAPER_PATH (default: ~/wallpaper.jpg)
# and also has lockscreen version in $LOCK_SCREEN_WALLPAPER_PATH (default: ~/lockscreen_wallpaper.jpg)

# This script should be able to
# - save wallpaper
#   -> ask for name (default: date +%Y-%m-%d_%H-%M-%S)
#   -> mkdir -p ~/Pictures/wallpapers
#   -> save to ~/Pictures/wallpapers/NAME.jpg
# - restore wallpaper by saving to $WALLPAPER_PATH and $LOCK_SCREEN_WALLPAPER_PATH 
# - preview and restore wallpaper (select with fzf, when selected, open with xdg-open, when closed, give option to restore the wallpaper)


WLPATH=${WALLPAPER_PATH:-"$HOME/wallpaper.jpg"}
LSWLPATH=${LOCK_SCREEN_WALLPAPER_PATH:-"$HOME/lockscreen_wallpaper.jpg"}

WALLPAPER_DIR=${WALLPAPER_DIR:-"$HOME/Pictures/wallpapers"}

mkdir -p "$WALLPAPER_DIR"
cd "$WALLPAPER_DIR" || exit 1

if [ "$1" = "save" ]; then
    NAME=${2:-$(date +%Y-%m-%d_%H-%M-%S)}
    cp "$WLPATH" "$WALLPAPER_DIR/$NAME.jpg"
    echo "Saved wallpaper to $WALLPAPER_DIR/$NAME.jpg"
    exit 0
elif [ "$1" = "list" ]; then
    ls -1 *.jpg *.png 2>/dev/null
    exit 0
elif [ "$1" = "restore" ]; then
    if [ -z "$2" ]; then
        # select with fzf
        SELECTED=$(ls -1 *.jpg *.png 2>/dev/null | fzf --prompt="Select wallpaper to restore: ")

        # first preview the selected wallpaper
        if [ -z "$SELECTED" ]; then
            echo "No wallpaper selected."
            exit 1
        fi
        xdg-open "$SELECTED"
        echo "Press Enter to restore the current wallpaper, or ctrl-c to abort."

        read -r

        cp "$SELECTED" "$WLPATH"
        magick "$WLPATH" -filter Gaussian -blur 0x8 -level 10%,90%,0.5 "$LSWLPATH"
        echo "Restored wallpaper from $WALLPAPER_DIR/$SELECTED"
        if command -v hyprctl &> /dev/null; then
            hyprctl hyprpaper unload all
            hyprctl hyprpaper preload "$WLPATH"
            hyprctl hyprpaper wallpaper ",$WLPATH"
        elif command -v swaymsg &> /dev/null; then
            swaymsg output "*" bg "$WLPATH" fill
        else
            echo "Neither hyprctl nor swaymsg found, cannot set wallpaper."
            exit 1
        fi
        exit 0
    fi
    exit 0
elif [ "$1" = "preview" ]; then
    SELECTED=$(ls -1 *.jpg *.png 2>/dev/null | fzf --prompt="Select wallpaper to preview: ")
    if [ -z "$SELECTED" ]; then
        echo "No wallpaper selected."
        exit 1
    fi

    xdg-open "$SELECTED"

    echo "Press Enter to restore the current wallpaper, or type 'restore' to set the selected wallpaper."
    read -r INPUT

    if [ "$INPUT" = "restore" ]; then
        cp "$SELECTED" "$WLPATH"
        magick "$WLPATH" -filter Gaussian -blur 0x8 -level 10%,90%,0.5 "$LSWLPATH"
        echo "Restored wallpaper from $WALLPAPER_DIR/$SELECTED"
        if command -v hyprctl &> /dev/null; then
            hyprctl hyprpaper unload all
            hyprctl hyprpaper preload "$WLPATH"
            hyprctl hyprpaper wallpaper ",$WLPATH"
        elif command -v swaymsg &> /dev/null; then
            swaymsg output "*" bg "$WLPATH" fill
        else
            echo "Neither hyprctl nor swaymsg found, cannot set wallpaper."
            exit 1
        fi
    else
        echo "Keeping current wallpaper."
    fi
    exit 0
else
    echo "Usage: $0 {save [name]|list|restore <name>|preview}"
    exit 1
fi
# End of script

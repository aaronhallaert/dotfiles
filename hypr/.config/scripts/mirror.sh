SOURCE=`hyprctl monitors all | grep "Monitor " | sed 's/Monitor \(.*\)(.*/\1/g' | fzf --header="source"`
DESTINATION=`hyprctl monitors all | grep "Monitor " | sed 's/Monitor \(.*\)(.*/\1/g' | fzf --header="destination"`

if [ "$SOURCE" == "$DESTINATION" ]; then
    echo "Source and destination are the same"
    exit 1
fi

hyprctl keyword monitor $DESTINATION, 1920x1080@60, 0x0, 1, mirror, $SOURCE


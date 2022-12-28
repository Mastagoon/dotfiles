#! /bin/bash
p="/home/$USER/Pictures/screenshots/screenshot $(date)-$((RANDOM/50 + 1)).png";
echo "$p";
maim "$p";
xclip -selection clipboard -t image/png -i "$p";
notify-send -u "low" -t 500 "Copied!" "Screenshot saved sucessfully!";

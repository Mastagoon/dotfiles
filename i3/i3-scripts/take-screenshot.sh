#! /bin/bash
p="/home/$USER/Pictures/screenshots/ss $(date).png";
echo "$p";
maim -s "$p";
xclip -selection clipboard -t image/png -i "$p";
notify-send -u "low" -t 500 "Copied!" "Screenshot saved sucessfully!";

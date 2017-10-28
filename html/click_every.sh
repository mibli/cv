#!/bin/sh

get_mouse_pos() {
    xdotool getmouselocation |
    sed -E 's/.*x:([0-9]+).*y:([0-9]+).*/\1 \2/'
}

click_on() {
    save="$(get_mouse_pos)"
    xdotool mousemove $1 $2
    xdotool click 1
    xdotool mousemove $save
}

while true; do
    click_on $2 $3
    sleep $1
done

#!/bin/sh

#echo current Brightness
current_brightness=$(xrandr --verbose --current | grep -A10 " connected" | grep "Brightness" | cut -d ':' -f 2)
screen_connected=$(xrandr --verbose --current | grep " connected" | cut -d " " -f 1)

if [[ -z "$2" ]]; then
  value="0.1"
else
  value=$2
fi

brightness_value=$current_brightness

case $1 in 
  -i|--increment)
    if [[ $current_brightness < 1 ]]; then
      brightness_value=$(echo "$current_brightness+$value"|bc)
    fi
  ;;
  -d|-decrement)
    if [[ $current_brightness > 0.3 ]]; then
      brightness_value=$(echo "$current_brightness-$value"|bc)
    fi
  ;;
esac
echo $screen_connected
xrandr --output $screen_connected --brightness $brightness_value

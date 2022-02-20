#!/bin/sh

#echo current Brightness
current=$(xrandr --verbose --current | grep -A10 " connected" | grep "Brightness" | cut -d ':' -f 2)


if [[ -z "$2" ]]; then
  value="0.1"
else
  value=$2
fi

brightness_value=$current

case $1 in 
  -i|--increment)
    if [[ $current < 1 ]]; then
      brightness_value=$(echo "$current+$value"|bc)
    fi
  ;;
  -d|-decrement)
    if [[ $current > 0.3 ]]; then
      brightness_value=$(echo "$current-$value"|bc)
    fi
  ;;
esac

xrandr --output eDP-1 --brightness $brightness_value

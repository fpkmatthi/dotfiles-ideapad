#!/bin/sh

get_brightness() {
  if [ -f /usr/bin/light ]; then
    light -G | cut -d '.' -f 1
  elif [ -f /usr/bin/xbacklight ]; then
    xbacklight -get | cut -d '.' -f 1
  fi
}

send_notification() {
  brightness=$(get_brightness)

  icon_name="/usr/share/icons/Papirus-Dark/16x16/apps/preferences-system-brightness-lock.svg"

  bar=$(seq -s "─" $((${brightness}/7)) | sed 's/[0-9]//g')

  dunstify "     ""$bar" -i "$icon_name" -t 2000 -h int:value:"${brightness}" -h string:synchronous:"$bar" --replace=555
}

increase_brightness() {
  if [ -f /usr/bin/light ]; then
    light -A 7
  elif [ -f /usr/bin/xbacklight ]; then
    xbacklight -inc 7
  fi
  send_notification
}

decrease_brightness() {
  if [ -f /usr/bin/light ]; then
    light -U 7
  elif [ -f /usr/bin/xbacklight ]; then
    xbacklight -dec 7
  fi
  send_notification
}

case $1 in
  up)
    increase_brightness
    ;;
  down)
    decrease_brightness
    ;;
esac

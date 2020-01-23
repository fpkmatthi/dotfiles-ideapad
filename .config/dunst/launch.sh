#!/bin/dash
  
killall -q dunst

while pgrep -u "$(id -ru)" -x dunst >/dev/null ;do sleep 1; done

dunst &


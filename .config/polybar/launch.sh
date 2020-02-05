#!/bin/dash

killall -q polybar

while pgrep -u "$(id -ru)" -x polybar >/dev/null ;do sleep 1; done

MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')

polybar main &
polybar second &

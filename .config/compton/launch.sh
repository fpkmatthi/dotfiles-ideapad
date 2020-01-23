#!/bin/dash
  
killall -q compton

while pgrep -u "$(id -ru)" -x compton >/dev/null ;do sleep 1; done

compton --config $HOME/.config/compton/compton.conf -b
#compton --config $HOME/.config/compton.conf -b


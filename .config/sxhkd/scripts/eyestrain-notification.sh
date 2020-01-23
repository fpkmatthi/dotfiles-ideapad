#!/bin/sh

time=$((20 - $(date '+%-M') % 20))

if [ $time -eq 20 ]; then
   dunstify 'Break' &
fi


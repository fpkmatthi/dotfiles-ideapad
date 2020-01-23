#!/bin/dash

killall -q redshift

while pgrep -u "$(id -ru)" -x redshift >/dev/null; do sleep 1; done

redshift &

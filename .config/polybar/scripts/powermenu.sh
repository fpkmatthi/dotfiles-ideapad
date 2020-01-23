#!/bin/dash

echo poweroff reboot exit | xargs -n 1 | rofi -dmenu | dash

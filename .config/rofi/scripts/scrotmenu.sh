#!/bin/sh

rofi_command="rofi -theme themes/scrotmenu.rasi"

# Icons {{{
screen=""
area=""
window=""
# }}}

chosen="$(echo -e "$screen\n$area\n$window" | $rofi_command -dmenu -selected-row 1)"

case $chosen in
    $screen)
        # sleep1 && scrot
        scrot -d 1 "$HOME/Pictures/Screenshot/%d-%m-%Y_%H-%M-%S.png"
        ;;
    $area)
        # scrot -s
        scrot -d 1 -s "$HOME/Pictures/Screenshot/%d-%m-%Y_%H-%M-%S.png"
        ;;
    $window)
        # sleep 1 && scrot -u
        scrot -d 1 -u "$HOME/Pictures/Screenshot/%d-%m-%Y_%H-%M-%S.png"
        ;;
esac


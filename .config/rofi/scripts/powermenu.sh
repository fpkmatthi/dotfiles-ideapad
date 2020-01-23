#!/bin/sh

rofi_command="rofi -theme themes/powermenu.rasi"

# Icons {{{
power_off=""
reboot=""
lock=""
suspend="鈴"
log_out=""
# }}}

chosen="$(echo -e "$power_off\n$reboot\n$lock\n$suspend\n$log_out" | $rofi_command -dmenu -selected-row 2)"

case $chosen in
    $power_off)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        $HOME/.config/i3/scripts/lock.sh
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
    $log_out)
        bspc quit
        ;;
esac


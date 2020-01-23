#!/bin/sh

rofi_command="rofi -theme themes/i3layoutmenu.rasi"

# Icons {{{
stacked=""
tabbed="ﬓ"
split="﬿"
# }}}

chosen="$(echo -e "$stacked\n$tabbed\n$split" | $rofi_command -dmenu -selected-row 1)"

# TODO: switch to bspwm
case $chosen in
    $stacked)
        # i3-msg layout stacked
        ;;
    $tabbed)
        # i3-msg layout tabbed
        ;;
    $split)
        # i3-msg layout toggle split
        ;;
esac


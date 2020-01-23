#!/bin/sh

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources
# sudo prime-switch && sleep 3 && prime-offload
prime-offload
exec bspwm

#!/bin/dash

openterminal() {
    $TERMINAL -e yay -Syu
    exit 0
}

checkforupdates() {
    if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
        updates_arch=0
    fi

    if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
        updates_aur=0
    fi

    updates=`expr $updates_arch + $updates_aur`

    if [ "$updates" -gt 0 ]; then
        echo "ﮮ $updates"
    else
        echo ""
    fi
}

usage() {
    echo "Usage: $0 {-u | -o}"
    echo "    -u|--update       displays the number of updates"
    echo "    -o|--open         open $TERMINAL and exec yay -Syu"
    echo "    -h|--help         display this"
}

case "$1" in
    -u|--update)
        checkforupdates
        ;;
    -o|--open)
        openterminal
        ;;
    -h|--help)
        usage
        ;;
    *)
        echo "unrecognized command"
        usage
        ;;
esac

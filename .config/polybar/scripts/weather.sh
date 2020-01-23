#!/bin/dash

[ -z "$location" ] || { location="$location+" && rm -f "$HOME/.local/share/weatherreport" ;}

check_connection() { 
    # TODO: ping wttr.in
    ping -q -c 1 wttr.in >/dev/null 2>&1  #&& notify-send "Cannot connect to weather service" && exit 1
}

update() {
    check_connection
    # min: 1
    # max: 3
    # current day=1, etc
    days_to_predict=$1
    [ $days_to_predict -lt 1 ] && exit 1
    [ $days_to_predict -gt 3 ] && exit 1
    rm -f "$HOME/.local/share/weatherreport" 
    curl -s "wttr.in/$location?$days_to_predict" > "$HOME/.local/share/weatherreport" || exit 1
}

getweather() {
    rainline=$1
    degreeline=$2

    printf "%s" "$(sed "${rainline}q;d" "$HOME/.local/share/weatherreport" | 
        grep -wo "[0-9]*%" | 
        sort -n | 
        sed -e '$!d' | 
        sed -e "s/^/ /g" | 
        tr -d '\n')"

    sed "${degreeline}q;d" "$HOME/.local/share/weatherreport" | 
        grep -o "m\\(-\\)*[0-9]\\+" | 
        sort -n -t 'm' -k 2n | 
        sed -e 1b -e '$!d' | 
        tr '\n|m' ' ' | 
        awk '{print " ",$1 "°C","盛",$2 "°C\n"}'
}

showweather() { 
    if [ "$days_to_predict" -eq 1 ]; then
        echo "Today"
        getweather 16 13
    elif [ "$days_to_predict" -eq 2 ]; then
        echo "Today"
        getweather 16 13
        echo "Tomorrow"
        getweather 26 23
    elif [ "$days_to_predict" -eq 3 ]; then
        echo "Today"
        getweather 16 13
        echo "Tomorrow"
        getweather 26 23
        echo "Day after tomorrow"
        getweather 36 33
    fi
}

usage () {
    echo "Usage: $0 {-f <forecast days> | -n <forecast days> | -t}"
    echo "    -f -- 1, 2 or 3 for respectively the current day, tomorrow and the day after tomorrow"
    echo "    -n -- 1, 2 or 3 for respectively the current day, tomorrow and the day after tomorrow"
    echo "    -t -- show the ouput in a terminal"
}


case $1 in
    -f|--forecast)
        # 1, 2 or 3
        update $2 && echo "" || exit 1
        ;;
    -n|--notify)
        pgrep -x dunst >/dev/null && notify-send  "$(update $2 && showweather)"
        ;;
    -t|--terminal)
        update $2
        $TERMINAL -e less -S "$HOME/.local/share/weatherreport" 
        ;;
    -h|--help)
        usage
        ;;
    *)
        echo "unreconized command"
        usage
esac

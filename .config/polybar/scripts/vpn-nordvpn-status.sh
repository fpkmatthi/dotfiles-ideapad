#!/bin/dash

### TODO: add options like --switch to switch state and --show to show state
usage()
{
    echo "if this was a real script you would see something useful here"
    echo ""
    echo "./simple_args_parsing.sh"
    echo "-h --help"
    echo ""
}

main() {
    action=$1
    status=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)
    isVpnProcessRunning=$(ps -A | egrep "nordvpn$" | tr -d " \n\r\t " | head -c1 | wc -c)

    if [ "$status" = "Connected" ]; then
        if [ "$action" = "switch" ]; then
            # disconnect && echo "shield" 
            nordvpn disconnect > /dev/null 2>&1 & #&& echo "%{F#f54242}ﱾ%{F-}" 
        elif [ "$action" = "status" ]; then
            # echo "busy or shield ip" 
            if [ $isVpnProcessRunning = 1 ]; then
                echo "%{F#fcbe42} ﱾ Busy%{F-}"
            else
                echo "%{F#60f542} ﱾ $(nordvpn status | grep IP | tr -d ' ' | cut -d ':' -f2) %{F-}"
            fi
        fi
    elif [ "$status" = "Disconnected" ]; then
        if [ "$action" = "switch" ]; then
            # connect && echo "shield ip" 
            nordvpn connect > /dev/null 2>&1 & #&& echo "%{F#60f542}ﱾ $(nordvpn status | grep IP | tr -d ' ' | cut -d ':' -f2)%{F-}"
        elif [ "$action" = "status" ]; then
            # echo "shield" 
            if [ $isVpnProcessRunning = 1 ]; then
                echo "%{F#fcbe42} ﱾ Busy %{F-}"
            else
                echo "%{F#f54242} ﱾ %{F-}"
            fi
        fi
    fi
}


while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        --status)
            main status 
            ;;
        --switch)
            main switch
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done



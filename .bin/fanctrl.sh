#!/usr/bin/env bash
#USE IN MY ALIENWARE M11XR1 (don't tested in other version)

COMMAND="$1"

case $COMMAND in
install)
    echo "Making /etc/thermal dir"
    
    mkdir /etc/thermal
    mkdir /etc/thermal/defaults
    mkdir /etc/thermal/lastest
    
    for STATE in /sys/devices/virtual/thermal/cooling_device*/cur_state ; do
        N=${STATE//[^0-9]/}
        echo "copy $STATE to /etc/thernal dir as cooler$N"
        cp $STATE "/etc/thermal/defaults/cooler$N"
        cp $STATE "/etc/thermal/lastest/cooler$N"
    done
    echo "copy this script($0) to /usr/bin"
    cp $0 /usr/bin/
    ;;
max)
    for MAX in /sys/devices/virtual/thermal/cooling_device*/max_state ; do
        N=${MAX//[^0-9]/}
        DIRNAME=$(dirname $MAX)
        CURSTATE=`cat "$DIRNAME/cur_state"`
        MAXSTATE=`cat $MAX`
        echo "Cooler$N from: $CURSTATE to: $MAXSTATE"
        cp $DIRNAME/cur_state "/etc/thermal/lastest/cooler$N"
        cat $MAX > $DIRNAME/cur_state
    done
    ;;
increment)
    for MAX in /sys/devices/virtual/thermal/cooling_device*/max_state ; do
        N=${MAX//[^0-9]/}
        DIRNAME=$(dirname $MAX)
        CURSTATE=`cat "/etc/thermal/lastest/cooler$N"`
        MAXSTATE=`cat $MAX`
        if [ "$CURSTATE" -lt "$MAXSTATE" ] ; then
            OLDSTATE=$CURSTATE
            let "CURSTATE+=1"
            echo "Cooler$N from $OLDSTATE to: $CURSTATE"
            echo $CURSTATE > $DIRNAME/cur_state
            echo $CURSTATE > "/etc/thermal/lastest/cooler$N"
        fi
    done
    ;;
decrement)
    for DEFAULT in /etc/thermal/defaults/cooler* ; do
        N=${DEFAULT//[^0-9]/}
        DIRNAME=/sys/devices/virtual/thermal/cooling_device$N
        CURSTATE=`cat "/etc/thermal/lastest/cooler$N"`
        DEFSTATE=`cat $DEFAULT`
        cp $DIRNAME/cur_state /etc/thermal/lastest/cooler$N
        
        if [ "$CURSTATE" -gt "$DEFSTATE" ] ; then
            OLDSTATE=$CURSTATE
            let "CURSTATE-=1"
            echo "Cooler$N from $OLDSTATE to: $CURSTATE"
            echo $CURSTATE > $DIRNAME/cur_state
            echo $CURSTATE > "/etc/thermal/lastest/cooler$N"
        fi
    done
    ;;
restore)
    for DEFAULT in /etc/thermal/defaults/cooler* ; do
        N=${DEFAULT//[^0-9]/}
        DIRNAME="/sys/devices/virtual/thermal/cooling_device$N"
        DEFSTATE=`cat $DEFAULT`
        echo "Cooler$N = $DEFSTATE"
        cat $DEFAULT > $DIRNAME/cur_state
        cat $DEFAULT > "/etc/thermal/lastest/cooler$N"
    done
    ;;
*)
    echo ""
    echo "Usage:"
    echo "Install this running as root: ./fanctrl.sh install"
    echo "After this you can run anywere as root: fanctrl [max|increment|decrement|restore|install]"
    echo "'fanctrl max' set your fan speed to max"
    echo "'fanctrl increment' increment 1 in fan speed (does nothing if current == max speed)"
    echo "'fanctrl decrement' decemente 1 in fan speed (does nothing if current == default speed)"
    echo "'fanctrl restore' restore you fan speed to default (default = value when instaled)"
    echo "'fanctrl install' install this app, set current to default (DON'T DO IT)"
    echo ""
    echo "current states:"
    for DEFAULT in /sys/devices/virtual/thermal/cooling_device*/cur_state ; do
        N=${DEFAULT//[^0-9]/}
        DEFSTATE=`cat $DEFAULT`
        echo "Cooler$N = $DEFSTATE"
    done
    exit 1
esac
#!/bin/bash

FILE="/tmp/touch"

DEVICES_LIST=$(qdbus6 org.kde.KWin | grep InputDevice/event)
DEVICE_NAME="ELAN2514:00 04F3:445D"

device_name_getter(){
    echo $( qdbus6 org.kde.KWin $1 org.freedesktop.DBus.Properties.Get org.kde.KWin.InputDevice name )
}

for DEV in $DEVICES_LIST; do
    NAME=$(device_name_getter $DEV)
    if [[ $NAME == $DEVICE_NAME ]]; then
        echo $DEV > $FILE
    fi
done

#!/bin/bash
SEARCHING_PHRASE="InputDevice/event"
DEVICES_LIST=$( qdbus6 org.kde.KWin | grep $SEARCHING_PHRASE )

device_name_getter(){
    echo $( qdbus6 org.kde.KWin $1 org.freedesktop.DBus.Properties.Get org.kde.KWin.InputDevice name )
}

for FILE in $DEVICES_LIST; do
    device_name_getter $FILE
done

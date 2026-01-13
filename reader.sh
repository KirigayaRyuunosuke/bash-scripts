#!/bin/bash

SERVICE_PATH="/org/kde/KWin/InputDevice/"
SERVICE_DOTTED="org.kde.KWin.InputDevice"
SERVICE_NAME="org.kde.keyboard"

FOUND=$(qdbus6 "$SERVICE_NAME" | grep "$SERVICE_PATH")

for MY_PATH in $FOUND; do

    echo -e "$MY_PATH" "\t" $(qdbus6 org.kde.KWin "$MY_PATH" org.freedesktop.DBus.Properties.Get "$SERVICE_DOTTED" enabled) "\t" $(qdbus6 org.kde.KWin "$MY_PATH" org.freedesktop.DBus.Properties.Get "$SERVICE_DOTTED" name)

done

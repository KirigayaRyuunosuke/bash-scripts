#!/bin/bash

#event3

DEV="/org/kde/KWin/InputDevice/event3"


IS_ENABLED=$(qdbus6 org.kde.KWin "$DEV" org.freedesktop.DBus.Properties.Get org.kde.KWin.InputDevice enabled)

if [ "$IS_ENABLED" == "true" ]; then
    qdbus6 org.kde.KWin "$DEV" org.freedesktop.DBus.Properties.Set org.kde.KWin.InputDevice enabled false
    MSG="Touchscreen: OFF"
else
    qdbus6 org.kde.KWin "$DEV" org.freedesktop.DBus.Properties.Set org.kde.KWin.InputDevice enabled true
    MSG="Touchscreen: ON"
fi

qdbus6 org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText "preferences-desktop-touchscreen" "$MSG"

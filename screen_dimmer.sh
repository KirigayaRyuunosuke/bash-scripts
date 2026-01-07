#!/bin/bash
while [ 1 ]; do
for (( I=0; I<=10000; I = I + 1000 )); do
    #echo $I
    qdbus6 org.freedesktop.PowerManagement /org/kde/ScreenBrightness/display0 org.kde.ScreenBrightness.Display.SetBrightness "$I" 0
done

for (( I=10000; I>=0; I = I - 1000 )); do
    #echo $I
    qdbus6 org.freedesktop.PowerManagement /org/kde/ScreenBrightness/display0 org.kde.ScreenBrightness.Display.SetBrightness "$I" 0
done
done

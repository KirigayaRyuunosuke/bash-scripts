#!/bin/bash

PROFILES=$(qdbus6 org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/PowerProfile org.kde.Solid.PowerManagement.Actions.PowerProfile.profileChoices)
CURRENT_PROFILE=$(qdbus6 org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/PowerProfile org.kde.Solid.PowerManagement.Actions.PowerProfile.currentProfile)
PROFILES_TAB=($PROFILES)

# echo "$PROFILES"
# echo "$CURRENT_PROFILE"

MAX=0
CURRENT_PROFILE_NUM=0
NEXT=0

for IN in $PROFILES; do
    ((MAX++))
    if [[ "$IN" == "$CURRENT_PROFILE" ]]; then
        CURRENT_PROFILE_NUM=$MAX
        NEXT=$((CURRENT_PROFILE_NUM))
    fi
done

if [[ $CURRENT_PROFILE_NUM -eq $MAX ]]; then
    NEXT=0
fi

MSG=${PROFILES_TAB[$NEXT]}

qdbus6 org.kde.Solid.PowerManagement /org/kde/Solid/PowerManagement/Actions/PowerProfile org.kde.Solid.PowerManagement.Actions.PowerProfile.setProfile $MSG
qdbus6 org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText "battery-profile-performance" "$MSG"

# kdialog --passivepopup "$MSG" 2

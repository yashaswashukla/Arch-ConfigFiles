#!/bin/bash
inhibitor_path=$(awk '/Name="Asus Keyboard"/ {for(i=0;i<2;i++) getline; print$0; exit}' /proc/bus/input/devices | grep -oP 'S: Sysfs=\K.*')
inhibitor_path="/sys${inhibitor_path}/inhibited"

if [[ -f $inhibitor_path ]]; then
    current_value=$(cat "$inhibitor_path")
    if [[ $current_value == "0" ]]; then
        sudo bash -c "echo "1" > ${inhibitor_path}" 
        notify-send "Keyboard Disabled"
    elif [[ $current_value == "1" ]]; then
        sudo bash -c "echo "0" > ${inhibitor_path}"
        notify-send "Keyboard Enabled"
    else
        echo "Error: Unexpected content in file."
        exit 1
    fi
else
    echo "Error: File not found."
    exit 1
fi


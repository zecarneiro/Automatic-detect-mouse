#!/bin/sh

pathHome=$(echo $HOME)
desktopFile="$pathHome/.config/autostart/automatic_detect_mouse.desktop"

# Uninstall
sudo rm -r /opt/AutomaticDetectMouse
rm $desktopFile
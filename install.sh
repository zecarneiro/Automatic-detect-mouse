#!/bin/sh
# Autor: José M. C. Noronha
# Data: 20/05/2018

# Set Definition
nameApp="automatic_detect_mouse"
nameDestop="$nameApp.desktop"
nameExecutale="$nameApp.sh"
appFolder="AutomaticDetectMouse/"
pathApp="/opt/"
pathHome=$(echo $HOME)
pathAutostart="$pathHome/.config/autostart"

# Define auto start folder - Verify exist autostart folder
./createFolder.sh $pathHome .config autostart

# Get info brightness
echo
xinput --list
echo

echo "Copy and paste touchpad device name. Example: ETPS/2 Elantech Touchpad"
read -p "Insert touchpad device name: " deviceName

# Install
sudo cp -r $appFolder $pathApp
sudo chmod -R 777 $pathApp$appFolder

# Create Desktop File
echo "
[Desktop Entry]
Type=Application
Exec=\"$pathApp$appFolder$nameExecutale\"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[pt]=AutomaticDetectMouse
Name=AutomaticDetectMouse
Comment[pt]=Detecta novos ratos e desactiva o touchpad
Comment=Detect new mouse e disable touchpad" > "$pathAutostart/$nameDestop"
chmod +x $pathAutostart/$nameDestop		# Set permission to exec

# Set default and personal brightness
sudo sed -i "s#DEVICENAME#$deviceName#" $pathApp$appFolder$nameExecutale
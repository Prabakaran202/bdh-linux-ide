#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "தயவுசெய்து இதை 'sudo ./uninstall.sh' என ரன் செய்யவும்."
  exit
fi

echo "BDH Linux IDE (Global) அன்-இன்ஸ்டால் செய்யப்படுகிறது..."

INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="/etc/bdh-ide"

if [ -f "$INSTALL_DIR/bdh-ide" ]; then
    rm "$INSTALL_DIR/bdh-ide"
    echo "Executable நீக்கப்பட்டது."
fi

if [ -d "$CONFIG_DIR" ]; then
    rm -rf "$CONFIG_DIR"
    echo "Configuration files நீக்கப்பட்டது."
fi

echo "அன்-இன்ஸ்டாலேஷன் முடிந்தது."

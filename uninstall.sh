#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "தயவுசெய்து இதை 'sudo ./uninstall.sh' என ரன் செய்யவும்."
  exit
fi

echo "BDH Linux IDE (Global) அன்-இன்ஸ்டால் செய்யப்படுகிறது..."

INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="/etc/bdh-ide"

# 1. Main Executable-ஐ நீக்குதல்
if [ -f "$INSTALL_DIR/bdh-ide" ]; then
    rm "$INSTALL_DIR/bdh-ide"
    echo "✅ Executable (bdh-ide) நீக்கப்பட்டது."
fi

# 2. Kill Command-ஐ நீக்குதல் (புதிதாக சேர்க்கப்பட்டது)
if [ -f "$INSTALL_DIR/bdh-ide-kill" ]; then
    rm "$INSTALL_DIR/bdh-ide-kill"
    echo "✅ Kill Command (bdh-ide-kill) நீக்கப்பட்டது."
fi

# 3. Configuration போல்டரை நீக்குதல்
if [ -d "$CONFIG_DIR" ]; then
    rm -rf "$CONFIG_DIR"
    echo "✅ Configuration files நீக்கப்பட்டன."
fi

echo "---------------------------------------------------"
echo "BDH Linux IDE வெற்றிகரமாக சிஸ்டமிலிருந்து நீக்கப்பட்டது!"
echo "---------------------------------------------------"

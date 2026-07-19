#!/bin/bash

# Sudo பர்மிஷன் உள்ளதா என சரிபார்க்க...
if [ "$EUID" -ne 0 ]; then
  echo "எச்சரிக்கை: Global ஆக இன்ஸ்டால் செய்ய Root உரிமை தேவை!"
  echo "தயவுசெய்து இதை 'sudo ./install.sh' என ரன் செய்யவும்."
  exit
fi

echo "BDH Linux IDE சிஸ்டம் முழுவதும் (Global) இன்ஸ்டால் செய்யப்படுகிறது..."

# Dependencies இன்ஸ்டால் செய்ய...
if [ -f "packages.txt" ]; then
    echo "தேவையான பேக்கேஜ்கள் இன்ஸ்டால் செய்யப்படுகின்றன..."
    pacman -S --needed $(cat packages.txt | tr '\n' ' ')
else
    echo "எச்சரிக்கை: packages.txt கோப்பு காணவில்லை!"
fi

# Global Paths
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="/etc/bdh-ide"

mkdir -p "$INSTALL_DIR"
mkdir -p "$CONFIG_DIR"

# 1. Main executable-ஐ காப்பி செய்தல்
cp bdh-ide "$INSTALL_DIR/bdh-ide"
chmod +x "$INSTALL_DIR/bdh-ide"

# 2. Configuration file-களை காப்பி செய்தல்
cp configs/tmux.conf "$CONFIG_DIR/tmux.conf"
cp configs/nanorc "$CONFIG_DIR/nanorc"

echo "Global இன்ஸ்டாலேஷன் வெற்றிகரமாக முடிந்தது!"
echo "இப்போது சிஸ்டமில் யார் வேண்டுமானாலும் எந்த போல்டரில் இருந்தும் 'bdh-ide' என டைப் செய்து திறக்கலாம்."

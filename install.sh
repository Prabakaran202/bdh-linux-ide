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

# Directories உருவாக்குதல்
mkdir -p "$INSTALL_DIR"
mkdir -p "$CONFIG_DIR"

# 1. Main executable-ஐ காப்பி செய்தல்
echo "Executable ஃபைல் செட் செய்யப்படுகிறது..."
cp bdh-ide "$INSTALL_DIR/bdh-ide"

# பயனர் வேறு எங்காவது காப்பி செய்திருந்தால் ஏற்படும் \r (Windows line endings) பிழையை ஆட்டோமேட்டிக்காக நீக்க
sed -i 's/\r$//' "$INSTALL_DIR/bdh-ide"

# ஆட்டோமேட்டிக்காக Execute Permission கொடுப்பதற்கு
chmod +x "$INSTALL_DIR/bdh-ide"

# 2. Configuration file-களை காப்பி செய்தல்
echo "Config ஃபைல்கள் காப்பி செய்யப்படுகின்றன..."
cp configs/tmux.conf "$CONFIG_DIR/tmux.conf"
cp configs/nanorc "$CONFIG_DIR/nanorc"

# Config ஃபைல்களுக்கு அனைவருக்கும் படிக்கும் (Read) உரிமை கொடுக்க
chmod -R 755 "$CONFIG_DIR"

echo "Global இன்ஸ்டாலேஷன் வெற்றிகரமாக முடிந்தது!"
echo "இப்போது சிஸ்டமில் யார் வேண்டுமானாலும் எந்த போல்டரில் இருந்தும் 'bdh-ide' என டைப் செய்து திறக்கலாம்."

#!/bin/bash

# Update system
echo "Updating system..."

sudo pacman -Syu --noconfirm

# mkr dir
echo "Making directories..."

mkdir -p  ~/Pictures/ss
mkdir -p  ~/.icons
mkdir -p  ~/.themes
mkdir -p  ~/Downloads

# Create symbolic links
echo "Syslinks..."
ln -sf ~/.config/archbspwm/dots/*  ~/.config/
ln -sf ~/.config/archbspwm/assets/scripts/* ~/.local/bin/

# icon for dunst

echo "dunst icon..."
sudo cp -r assets/BeautyLine /usr/share/icons/

# installing necessary app

sudo pacman -S --noconfirm --needed alacritty rofi dunst fish fastfetch kitty picom sxhkd yazi fzf zoxide pamixer maim xclip lsd ttf-jetbrains-mono-nerd polkit-gnome xorg-xsetroot acpi awk unzip brightnessctl playerctl imlib2 rofi-emoji xfce4-power-manager network-manager-applet bat xorg sddm pacman-contrib bspwm polybar python-pip nitrogen nano nemo lxappearance noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra mpv qt5ct qt6ct htop cmus  xdg-desktop-portal-gtk


# Set QT and Java environment variables
echo "Setting environment variables..."

# Set QT_QPA_PLATFORMTHEME in /etc/environment
if ! grep -q "^QT_QPA_PLATFORMTHEME=qt5ct" /etc/environment; then
    echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee -a /etc/environment > /dev/null
fi

# Set _JAVA_AWT_WM_NONREPARENTING in /etc/profile
if ! grep -q "^export _JAVA_AWT_WM_NONREPARENTING=1" /etc/profile; then
    echo "export _JAVA_AWT_WM_NONREPARENTING=1" | sudo tee -a /etc/profile > /dev/null
fi

echo "Environment variables set successfully."

# Setup Python virtual environment
echo "Setting up Python virtual environment..."
python -m venv ~/.mv
source ~/.mv/bin/activate
pip install pywal16
wal --cols16 -o ~/.config/bspwm/wal.sh -i ~/.config/archbspwm/assets/a.png

# Create the rule file
sudo touch /etc/udev/rules.d/90-backlight.rules

# Add content using tee
echo 'SUBSYSTEM=="backlight", RUN+="/usr/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"' | sudo tee /etc/udev/rules.d/90-backlight.rules > /dev/null
echo 'SUBSYSTEM=="backlight", RUN+="/usr/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"' | sudo tee -a /etc/udev/rules.d/90-backlight.rules > /dev/null

# Reload udev rules and trigger them
sudo udevadm control --reload-rules
sudo udevadm trigger

sudo usermod -aG video $USER

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'


# Clipboard

echo "CLipboard"
wget -O ~/.local/bin/greenclip https://github.com/erebe/greenclip/releases/download/v4.2/greenclip
chmod +x ~/.local/bin/greenclip

# Change default shell to fish
echo "Changing default shell to fish..."
chsh -s "$(which fish)"

# promt
echo "Promt"
curl -s https://ohmyposh.dev/install.sh | bash -s

# dm
sudo systemctl disable display-manager.service
sudo systemctl enable sddm.service
echo "SDDM Enabled"

echo "Finished"
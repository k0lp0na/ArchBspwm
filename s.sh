#!/bin/bash

# Enable tap-to-click and natural scrolling for touchpad
echo "fixing touchpad"
sudo touch /etc/X11/xorg.conf.d/40-libinput.conf
sudo tee /etc/X11/xorg.conf.d/40-libinput.conf > /dev/null << 'EOF'
Section "InputClass"
    Identifier "libinput touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "NaturalScrolling" "on"
EndSection
EOF



source ~/.mv/bin/activate
pip install anipy-cli

# setup paru

echo "Setting up PARU"
sudo pacman -S --needed base-devel
git clone --depth 1 https://aur.archlinux.org/paru.git ~/Downloads/paru
cd ~/Downloads/paru
makepkg -si
rm -r ~/Downloads/paru

#  browser 

paru -S --noconfirm --needed brave-bin

echo "DOE!"
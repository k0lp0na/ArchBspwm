#! /bin/bash


source ~/.mv/bin/activate

wal -R

# Symlink dunst config
ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc

# Restart dunst with the new color scheme
pkill dunst
dunst &

(echo "* {"; cat ~/.cache/wal/cos.rasi; echo "}") | tee ~/.config/rofi/cos.rasi

notify-send Wellcome!
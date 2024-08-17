Movin to ~~fedora 40~~ nope arch it is

# SCREENSHOT 🖼️

![Alt text](/ss/p1.png?raw=true "Optional Title")
![Alt text](/ss/lock.png?raw=true "Optional Title")
![Alt text](/ss/p2.png?raw=true "Optional Title")
![Alt text](/ss/p3.png?raw=true "Optional Title")
![Alt text](/ss/p4.png?raw=true "Optional Title")


### Old Polybar

![Alt text](/ss/oldpoly1.png?raw=true "Optional Title")

![Alt text](/ss/oldpoly2.png?raw=true "Optional Title")



----------------Software used----------------

**WM** = BSPWM

**terminal** = Alacritty 

**Bar** = Polybar (_needs playerctl, video grp and pacman-contrib_)

**file** = nemo and kitty + yazi

**music** = spotify and amberol

**cli tool** = pipe.sh , cava ,fastfetch ,htop ,anipy-cli, pfetch-rc, tty-clock, asciiquarium, nitch, cmatrix, cbonsai, asciiquarium 

**text** = xed nano

**spotify** = spicify 

**app launcher** = rofi, greenclip, rofi-emoji

**browser** = brave , firefox , chromium (gbf) 

**shell** = zsh, lsd, fzf, zinit , zoxide

**notif** = dunst 

**Font** = JetBraonsMono Nerd , noto bangla, cjk for jp,kr,c

**image** = gthumb

**colors** = Pywal16

**sddm theme** = suger-candy

# Commands 💻

install arch or archinstall whatever pipewire audio don`t forgor to reflector cuz the automatic one is shit

## Important depends if no pywal then bspwm won`t open ####

connect wifi

```
nmcli device wifi connect !name! password !psswd!
```
mirror fix

```
sudo reflector --country 'Bangladesh' --latest 10 --sort rate --save /etc/pacman.d/mirrorlist
```
update

```
sudo pacman -Syu
```
base installs

```
sudo paman -S xorg xorg-xsetroot bspwm sxhkd alacritty neno firefox rofi scrot xclip polybar vulkan-intel dunst fastfetch git sddm picom 
```

_(if hardware allows then fork of picom)_


set login maneger

```
sudo systemctl enable sddm
```
clone dots

```
git clone https://github.com/k0lp0na/ArchBspwm.git
```


```
mv ArchBspwm dots
```


```
cd dots 
./link.sh
```

**get JetbrainMono Nerd**

```
sudo pacman -S ttf-jetbrains-mono-nerd
```

**pywal 🎨**

```
pacmn -S python-pip imagemagick nitrogen 

python -m venv myenv #(must be named myenv)
source myenv/bin/activate

pip pywal16 #[probly nedd vir env]
```


git clone wallpaper

set wall


```
wal --cols16 -i ~/wall/....
```

_now reboot_

_**login hopefully it worked**_

### Zsh 

setup zsh

```
sudo pacman -S zsh zoxide lsd fzf 

chsh -s ${which zsh}
```

add flatpaks pobly will use it in future


reboot


### pacman ###

IloveCandy and Color in /etc/pacman.conf [i think might be wrong]



### Fix toucepad 

```
sudo nano /etc/X11/xorg.conf.d/40-libinput.conf
```

add

```
Section "InputClass"
    Identifier "libinput touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "NaturalScrolling" "on"
EndSection
```

### Fix polybar Brightness

```
sudo nano /etc/udev/rules.d/90-backlight.rules
```
Add

```
SUBSYSTEM=="backlight", RUN+="/usr/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
SUBSYSTEM=="backlight", RUN+="/usr/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"
```

```
sudo udevadm control --reload-rules
sudo udevadm trigger
```

```
sudo usermod -aG video $USER
```

```
groups your-username
```

reboot

# post things

multilib 

install yay #cuz paru doesnt want to play with me why wont she play with me

```
in lxappearance qt5ct qt6ct mpv kitty yazi xed qbittorrent playerctl pacman-contrib chromium discord xfce4-power-manager noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra rofi-emoji xdotool asciiquarium cmatrix
```

**get  whitsur dark theme**

**get icon beautyline**

**get cursor breeze light or Phinger cursor**


###  codexs

idk everything  just works

```
in vlc

out vlc
```

thats it sooo simple why cant fedora be like this and just play nice


yay spotify greenclip brave jdownloader cava pipe.sh cbonsai tty-clock

# other 


### anime

```
re && pip install anipycli
```

### if jdownloader goes blank white 

```
sudo nano /etc/profile
```

Add

```
export _JAVA_AWT_WM_NONREPARENTING=1
```

### if amberol stay light theme

```
in xdg-desktop-portal-gtk

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
```

### if qt5ct doesnt work

```
sudo nano /etc/environment 
```

add
```
 QT_QPA_PLATFORMTHEME=qt5ct
```
reboot

### bangla text issue

**change browser font to a bangla one**

**discord issue idk how to fix**

**same for polybar**


## sddm theme 

```
chsddm 
```

change theme to theme 

move picture to theme older usually at /usr/share/sddm/themes/Sugar-Candy/

```
chsugar
```

now type image dir must be on same folder as theme being in ~ doesn`t seem to work

ya good

check by

```
sddm-greeter --test-mode --theme /usr/share/sddm/themes/Sugar-Candy 
```

### lock screen 

go build betterlockscreen from srouce


# clr and update
```
opr
```


```
clr
```


```
updt
```
-----------------------------------------------------------------

Now hopefully I have a complete setup for my day to day use i wanted someething dynamic color its my first rice and man pywal is awsome everything followa it but
i have to 

chrofi and change color from color.json from ~/.cache/wal/color.json

and change sddm thing by cping png into it and chsugar

I dont know how to automate it if you know them feel free to let me know

_**NOW! enjoy the setup and maybe actually do some work instead of configing .dotfiles**_

 

Movin to ~~fedora 40~~ nope arch it is

# SCREENSHOT 🖼️

![Alt text](/assets/ss/p1.png?raw=true "Optional Title")
![Alt text](/assets/ss/p2.png?raw=true "Optional Title")
![Alt text](/assets/ss/p3.png?raw=true "Optional Title")
![Alt text](/assets/ss/p4.png?raw=true "Optional Title")
![Alt text](/assets/ss/p5.png?raw=true "Optional Title")

### Old Polybar

![Alt text](/assets/ss/oldpoly1.png?raw=true "Optional Title")

![Alt text](/assets/ss/oldpoly2.png?raw=true "Optional Title")



----------------Software used----------------

**WM** = BSPWM

**terminal** = Alacritty 

**Bar** = Polybar (_needs playerctl, video grp and pacman-contrib_)

**file** = nemo and kitty + yazi

**music** = spotify and cmus

**cli tool** = pipe.sh , cava ,fastfetch ,htop ,anipy-cli, pfetch-rc, tty-clock, asciiquarium, nitch, cmatrix, cbonsai, asciiquarium 

**text** = xed nano

**spotify** = spicify 

**app launcher** = rofi, greenclip, rofi-emoji

**browser** = brave

**shell** = fish, lsd, fzf, zoxide

**notif** = dunst 

**Font** = JetBraonsMono Nerd , noto bangla, cjk for jp,kr,c

**image** = gthumb

**colors** = Pywal16


# Installation ⚙

connect to the internet

```
nmcli device wifi connect !name! password !psswd!
```

config pacman 

```
sudo nano /etc/pacman.conf
```

and add

```
Color
CheckSpace
VerbosePkgLists
ParallelDownloads = 5
ILoveCandy
```

install git and reflector

```
sudo pacman -S git reflector
```

fic mirrors

```
sudo reflector --country 'Bangladesh' --latest 10 --sort rate --save /etc/pacman.d/mirrorlist 
```

cd into .config

```
mkdir -p ~/.config
cd ~/.config/
```

clone the repo and run the install script

```
git clone --depth 1 https://github.com/k0lp0na/archbspwm.git

cd archbspwm/

./install[arch].sh
```

-----------------------------------------------------------------

Now hopefully I have a complete setup for my day to day use i wanted someething dynamic color its my first rice and man pywal is awsome everything followa it 

_**NOW! enjoy the setup and maybe actually do some work instead of configing .dotfiles**_

 

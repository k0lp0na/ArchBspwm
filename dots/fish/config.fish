# kaawai fetch

fastfetch -c ~/.config/fastfetch/com.jsonc

# remove welcome 
set -g fish_greeting


#allias 


function ls
    lsd 
end


function dclean
    rm -f drw.o dwm.o dwm-msg.o util.o config.h
end

function dmake
    sudo make clean install
end

function ff
    fastfetch $argv
end

function updt
    sudo pacman -Syu && sudo paru
end

function in
    sudo pacman -S $argv
end


function out
    sudo pacman -R $argv
end

function exile
    sudo pacman -Rs $argv
end

function pin
   sudo paru $argv
end


function vim 
   nvim $argv
end

function wap
    source ~/.mv/bin/activate.fish && wal --cols16 -o ~/.config/bspwm/wal.sh -i $argv 
end


# set PATH
set -gx PATH ~/.local/bin $PATH

# init
oh-my-posh init fish --config ~/.config/oh-my-posh/promt.toml | source
zoxide init fish | source
fzf --fish | source
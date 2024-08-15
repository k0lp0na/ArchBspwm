# autostart

pfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
 

# Install sys
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"


#START ZINIT
source "${ZINIT_HOME}/zinit.zsh"


# IT'S OVER 9000
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k


# History
HISTSIZE=100000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Load plugins

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light Freed-Wu/zsh-command-not-found

zinit ice wait lucid
zinit light MichaelAquilina/zsh-auto-notify


# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q


# Style
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
#zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:z:*' fzf-preview 'lsd --icon always --color always $realpath'

# Key bindings
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5A' history-search-backward
bindkey '^[[1;5B' history-search-forward


# Aliases
 #CMD
alias c='clear'
alias ls='lsd'

 #Pywal
alias wl='source ~/myenv/bin/activate && wal --cols16 -i'
alias re="source ~/myenv/bin/activate && wal -R"

 #Anime
alias ani="source ~/myenv/bin/activate && anipy-cli"
alias anim="source ~/myenv/bin/activate && anipy-cli -M"

 #fetch unixporn
alias ff='fastfetch'
alias nf='ff -c ~/dots/fastfetch/nitb.jsonc'
alias pf='pfetch'
alias bf="ff -c ~/dots/fastfetch/boxb.jsonc"
alias pipe3="pipes.sh -t3"
alias pipe="pipes.sh"
alias pipei="pipes.sh -t0"

 #System
alias in='sudo pacman -S'
alias out='sudo pacman -R'
alias updt='sudo pacman -Syu && yay -Syu'
alias orp="pacman -Qdtq"
alias clr="sudo pacman -Rsn $(pacman -Qdtq)"
alias zupdate='zinit self-update'

 #Misc
alias chsddm="sudo nano /usr/lib/sddm/sddm.conf.d/default.conf"
alias chsugar="sudo nano /usr/share/sddm/themes/Sugar-Candy/theme.conf"
alias chrofi="nano ~/.config/rofi/cos.rasi"

export PATH="$PATH:/home/$USER/.local/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## inits
source <(fzf --zsh)
eval "$(zoxide init zsh)"

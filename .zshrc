#!/bin/bash

# automatically start i3 window manager
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

# User configuration
export PATH=/usr/local/bin:~/.npm-global/bin:~/.local/bin:$HOME/bin:/usr/local/sbin:$HOME/n/bin:$PATH
export PATH=$(npm bin):$PATH
export LANG=en_US.UTF-8
export ZSH=$HOME/.oh-my-zsh
export EDITOR=/usr/bin/neovide

# Variable declaration used by oh-my-zsh
ZSH_THEME="pragmata"
HIST_STAMPS="dd.mm.yyyy"
plugins=(git history zsh-syntax-highlighting zsh-autosuggestions)

# Start by inheriting default os oh-my-zsh (git aliases, etc)
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# My aliases
alias yay='paru' # paru is rust, yay is go. alias due to muscle memory
alias yeet='paru -Rcs' # always forget remove flags
alias ssh='TERM=xterm-color ssh' # kitty does weird things, set it explicitly
alias icat='kitty +kitten icat'
alias gbclean=$'git branch --merged master | grep -v \'^[ *]*master$\' | xargs git branch -d'
alias ls='exa' # 1:1 ls replacement
alias l='ls -lbF' # list, size, type
alias ll='ls -al' # long, list
alias llm='ll --sort=modified' # list, long, sort by modification date
alias la='ls -lbhHigUmuSa' # all list
alias lx='ls -lbhHigUmuSa@' # all list and extended
alias lS='exa -1' # just names
alias search='rg'
alias searchAround='rg -C'
alias tree='broot -c :pt "$@"'
alias cat='bat'
alias rvimtmp='rm -i `find . | grep .swp$`'
alias searchFiles='fd'
alias du='ncdu --color dark -rr -x --exclude .git --exclude node_modules'
alias top='glances'
alias pbcopy='xsel --clipboard --input' # pbcopy < ./filename.txt (pb stands for pasteboard, see osx pbcopy man)
alias pbpaste='xsel --clipboard --output' # pbpaste > ./filename.txt
alias cal='rusti-cal'
alias calendar='rusti-cal'
alias weather='curl v2d.wttr.in'
alias has="curl -sL https://git.io/_has | bash -s" # dependency checker to validate versions
alias ps="procs"
alias dict="sdcv"
alias nnn="nnn -e" # open nnn with neovide as the editor
alias tv="tidy-viewer" # easy way to preview csv files

# Vim mode (default mode is insert)
bindkey -v

# My Functions
walk () {
  mkdir -p -- "$1" && cd -P -- "$1"
}
close () {
  read REPLY"?Remove current directory? [Y/n] "
  if [[ ! $REPLY =~ ^[Nn]$ ]] then
    rm -rf -- "$(pwd -P)" && cd ..
  fi
}

# Plugin bootstraps
eval "$(zoxide init zsh)"

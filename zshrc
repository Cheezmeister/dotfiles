export HISTFILE="$HOME/.history"
export SAVEHIST=10000

# Aliases
source ~/dotfiles/aliases

# Incremental search is friggin useful
bindkey "^R" history-incremental-search-backward
setopt extendedglob

autoload -U compinit
compinit

# From http://bit.ly/Nuqs2R
## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# From https://gist.github.com/yagihiro/173169
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# From http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}[%F{blue}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }

# Prompt
export RPROMPT="%B%F{cyan}%~%f%b | %B%F{green}$USER@%M%f%b"
export PROMPT="%B%F{yellow}%l%f%F{blue}${vcs_info_msg_0_}%f%# %f%b"
export PS1=$PROMPT

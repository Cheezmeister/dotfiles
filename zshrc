export HISTFILE="$HOME/.history"
export SAVEHIST=10000

# Aliases
alias -g px='| xargs'
alias -g pg='| grep'

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

# Prompt
source ~/dotfiles/zprompt

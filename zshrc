# :D
export RPROMPT="%B%F{cyan}%~%f%b | %M | %B%F{green}%D{%a %b %d} %D{%I:%M%P}%f%b"
export PROMPT="%B%F{yellow}%l%F{blue}%1v%f %#%f%b "
export PS1=$PROMPT

# Alphabeticals
alias @='sudo'
alias a='ls -aph'
alias c='cat'
alias d='cd'
alias e='exit'
alias g='git'
alias h='hg'
alias l='ls -lph'
alias m=$PAGER
alias o=$OPENER
alias p='grep -P'
alias s='ls'
alias t='todo.sh'
alias u='cd ..'
alias v=$VISUAL
alias x='tmux -2'

# Meta
alias rz='source ~/.zshrc'
alias ez="$EDITOR ~/.zshrc"

# Git
alias gs='git status'
alias gd='git diff'

# Tmux
alias xa='tmux -2 attach -t'
alias xn='tmux -2 new-session -s'

# Applications
alias web=$WEB_BROWSER
alias term=$TERMINAL
alias fm='$FILE_MANAGER .'

# Misc
alias untargz='tar xvzf'
alias targz='tar cvzf'
alias syc='systemctl'
alias ssyc='sudo systemctl'
alias psag='ps aux | grep'
alias obliterate='rm -rf'

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

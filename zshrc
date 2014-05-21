# :D
export RPROMPT="%B%F{cyan}%~%f%b | %n@%M | %B%F{green}%D{%a %b %d} %D{%I:%M:%S%P}%f%b"
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
alias s='ls'
alias t='todo.sh'
alias u='cd ..'
alias v='vim'
alias x='tmux -2'

# Git
alias gs='git status'
alias gd='git diff'

# Tmux
alias ta='tmux -2 attach -t'
alias tn='tmux -2 new-session -s'

# Meta
alias rz='source ~/.zshrc'
alias ez="$EDITOR ~/.zshrc"

# Applications
alias web=$WEB_BROWSER
alias term=$TERMINAL
alias fm='$FILE_MANAGER .'
alias open='$OPENER'

# Misc
alias untargz='tar xvzf'
alias targz='tar cvzf'
alias syc='systemctl'
alias ssyc='sudo systemctl'

setopt extendedglob

autoload -U compinit
compinit

# From http://bit.ly/Nuqs2R
## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# From https://gist.github.com/yagihiro/173169
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

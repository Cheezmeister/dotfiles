# :D
export RPROMPT="%B%F{cyan}%~%f%b | %n@%M | %B%F{green}%D{%a %b %d} %D{%I:%M:%S%P}%f%b"
export PROMPT="%B%F{yellow}%l%F{blue}%1v%f %#%f%b "
export PS1=$PROMPT

# Path
export PATH=$PATH:~/bin

# Alphabeticals
alias a='ls -aph'
alias d='cd'
alias e='exit'
alias g='git'
alias l='ls -lph'
alias m=$PAGER
alias s='ls'
alias u='cd ..'
alias x='tmux -2'

# Git
alias gs='git status'
alias gd='git diff'

# Tmux
alias ta='tmux -2 attach -t'
alias td='tmux -2 detach'
alias tlss='tmux -2 list-sessions'
alias tns='tmux -2 new-session -s'

# Meta
alias resrc='source ~/.zshrc'
alias edsrc="$EDITOR ~/.zshrc"

# Applications
alias web=$WEB_BROWSER
alias term=$TERMINAL
alias fm='$FILE_MANAGER .'
alias open='$OPENER'

# Misc
alias untargz='tar xvzf'
alias targz='tar cvzf'

setopt extendedglob

# From http://bit.ly/Nuqs2R
## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

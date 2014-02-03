# :D
export RPROMPT="%B%F{cyan}%~%f%b | %n@%M | %B%F{green}%D{%a %b %d} %D{%I:%M:%S%P}%f%b"
export PROMPT="%B%F{yellow}%l%F{blue}%1v%f %#%f%b "
export PS1=$PROMPT

# Git 
alias gs='git status'
alias gsh='git stash'
alias gd='git diff --color=auto'
alias gds='git diff --color=auto --staged'
alias gcm='git commit --message'
alias gca='git commit --all'
alias gcam='git commit --all --message'
alias gpom='git pull origin master'

# Tmux
alias ta='tmux attach -t'
alias td='tmux detach'
alias trw='tmux rename-window'
alias tlss='tmux list-sessions'
alias tns='tmux new-session -s'

# Meta
alias resrc='source ~/.zshrc'
alias edsrc="$EDITOR ~/.zshrc"

# Applications
alias web=$WEB_BROWSER
alias term=$TERMINAL
alias fm='$FILE_MANAGER .'
alias open='$OPENER'

# Misc
alias synergys-boot='killall synergys && synergys -d INFO'
alias untargz='tar xvzf'
alias targz='tar cvzf'

eval $(dircolors -b)
unsetopt CASE_GLOB  
setopt EXTENDED_GLOB


export HISTFILE="$HOME/.history"
export SAVEHIST=10000
export HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"

# Global Aliases For Piping Things
alias -g px='| xargs'
alias -g pg='| grep'
alias -g pl='| less'
alias -g pc='| copy-to-clipboard'
alias -g pwc='| wc'

# Global aliases for Anding things
alias -g sendit='&& git push'
alias -g and-tell-me='&& say "That long running thing is now done" || echo "\a"'

# Expand aliases as I type
globalias() {
   zle _expand_alias
   zle expand-word
   zle self-insert
}
zle -N globalias
bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches


# Incremental search is friggin useful
bindkey "^R" history-incremental-search-backward
setopt extendedglob

# Completions
autoload -U compinit
compinit
compdef '__tmux-sessions' ecks.pl # For http://luchenlabs.com/lp/ecks

# From http://bit.ly/Nuqs2R
## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# From https://gist.github.com/yagihiro/173169
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# Make sure NPM does not require sudo
# which npm && npm config set prefix ~/.npm


# Prompt
source $DOTFILES/zprompt

# Aliases
source $DOTFILES/aliases

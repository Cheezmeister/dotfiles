#!/bin/sh


# Where did we check out?
export DOTFILES=`dirname $(readlink -f $0)`
echo >> $DOTFILES/profile "export DOTFILES=$DOTFILES"
echo "Dotfiles dir set to $DOTFILES"

# Git is all special.
echo >> ~/.gitconfig "[include]"
echo >> ~/.gitconfig "    path = $DOTFILES/gitconfig"

# Errything else uses "source" like good citizens.
for dotfile in abcde.conf zshrc vimrc tmux.conf profile zshenv zprofile xinitrc xmodmaprc bashrc; do
  if [ -e $DOTFILES/$dotfile ]; then 
    echo >> ~/.$dotfile source $DOTFILES/$dotfile || echo "Couldn't patch $dotfile: $?"
    echo "$dotfile patched."
  fi
done

mkdir -p bin && curl http://luchenlabs.com/lp/ecks.pl > bin/ecks.pl && chmod +x bin/ecks.pl

#!/bin/sh


# Where did we check out?
export DOTFILES=`dirname $(readlink -f $0)`
echo >> profile "export DOTFILES=$DOTFILES"
echo "Dotfiles dir set to $DOTFILES"

# Git is all special.
echo >> ~/.gitconfig "[include]"
echo >> ~/.gitconfig "    path = $DOTFILES/gitconfig"

# Errything else uses "source" like good citizens.
for rc in abcde.conf zshrc vimrc tmux.conf profile zprofile xinitrc xmodmaprc bashrc
do
  if [ ! -e $DOTFILES/$rc ]; then 
    continue 
  fi

  echo source $DOTFILES/$rc >> ~/.$rc || echo "Couldn't patch $rc: $?"
  echo "$rc patched."
done


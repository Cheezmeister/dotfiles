#!/bin/sh

export DOTFILES=$PWD
echo >> profile "export DOTFILES=$PWD"

echo "Dotfiles dir set to $DOTFILES"


echo >> ~/.gitconfig "[include]"
echo >> ~/.gitconfig "    path = $DOTFILES/gitconfig"
exit

for rc in abcde.conf zshrc vimrc tmux.conf profile zprofile xinitrc xmodmaprc bashrc
do
  if [ ! -e $DOTFILES/$rc ]; then 
    continue 
  fi

  echo source $DOTFILES/$rc >> ~/.$rc || echo "Couldn't patch $rc: $?"
  echo "$rc patched."
done


#!/bin/sh

DOTFILES=~/stuff/dotfiles

for rc in zshrc vimrc tmux.conf profile xinitrc xmodmaprc
do
  if [ ! -e $DOTFILES/$rc ]; then 
    continue 
  fi

  echo source $DOTFILES/$rc >> ~/.$rc || echo "Couldn't patch $rc: $?"
  echo "$rc patched."
done

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim 
echo "Pathogen installed."

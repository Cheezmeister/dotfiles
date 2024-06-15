#!/bin/sh


# Where did we check out?
export DOTFILES=$(dirname $PWD/$0)
echo "Dotfiles dir set to $DOTFILES"

# Git Config must be symlinked
ln -s $DOTFILES/gitconfig ~/.gitconfig

# Env vars in *profile
for profile in zshenv profile zprofile bash_profile; do
  echo >> ~/.$profile "export DOTFILES=$DOTFILES"
  echo >> ~/.$profile source $DOTFILES/profile || echo "Couldn't patch $profile: $?"
  echo "$profile patched."
done


# Errything else uses "source" like good citizens.
for dotfile in abcde.conf zshrc vimrc tmux.conf xinitrc xmodmaprc bashrc; do
  if [ -e $DOTFILES/$dotfile ]; then 
    echo >> ~/.$dotfile source $DOTFILES/$dotfile || echo "Couldn't patch $dotfile: $?"
    echo "$dotfile patched."
  fi
done

mkdir -p bin && curl http://luchenlabs.com/lp/ecks.pl > bin/ecks.pl && chmod +x bin/ecks.pl

read -rp 'Create WSL symlinks (/a, /c, /h, /s, /u)? [Yn]' yn && [[ ! $yn =~ ^[Nn]$ ]] && {
  ln -s /mnt/c/Users/Cheezmeister/AppData /a
  ln -s /mnt/c                            /c
  ln -s $HOME                             /h
  ln -s $HOME/stuff                       /s
  ln -s /mnt/c/Users/Cheezmeister         /u
}

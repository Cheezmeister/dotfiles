DOTFILES=~/dotfiles

for rc in zshrc vimrc 
do
  if [ ! -e $DOTFILES/$rc ]; then 
    continue 
  fi

  echo source $DOTFILES/$rc >> ~/.$rc || echo "Couldn't patch $rc: $?"
  echo "$rc patched."
done


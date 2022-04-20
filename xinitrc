#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xmodmap
command -v xfce4-terminal && xfce4-terminal &

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


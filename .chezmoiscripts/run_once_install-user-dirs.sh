#!/bin/bash

DIRS="desktop documents downloads music pictures public templates videos"

if [ ! -e "~/.xdg" ]; then
    mkdir ~/.xdg
fi

for DIR in $DIRS; do
    mkdir "~/.xdg/$DIR"
done

if [ -e "~/.local/share/chezmoi/wallpapers.tar" ]; then
    command -v tar > /dev/null || exit 1
    mkdir ~/.xdg/pictures/wallpapers
    tar --directory ~/.xdg/pictures/wallpapers --extract --file ~/.local/share/chezmoi/wallpapers.tar
fi

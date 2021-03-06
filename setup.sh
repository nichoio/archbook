#!/bin/bash

# Logout after execution to activate
sudo pacman -S --noconfirm fish gvim tmux
chsh -s /bin/fish

# vim
mkdir -p ~/.vim/pack
mkdir -p ~/.vim/after/plugin
mkdir ~/.vim/sessions
ln -s ./.vimrc ~/.vimrc
ln -s ./.vimrc_after ~/.vim/after/plugin/after.vim
ln -s ./.vim-packs ~/.vim/pack/git-packs

# misc
ln -s ./.tmux.conf ~/.tmux.conf
ln -s ./.pylintrc ~/.pylintrc
ln -s ./fish/functions/ ~/.config/fish/functions

# JS tools
sudo npm install jsonlint -g
sudo npm install eslint eslint-plugin-vue -g

# TODO: KDE specific: dont open Yakuake at login
# TODO: KDE: change terminal theme to solarized, increase font to 11 or 12 -> ~/.local/share/konsole
# TODO: try making more omf themes work (maybe related to powerline fonts)
# TODO: install kubectl, install docker, add user to docker group
# TODO: find ls tool that also displays dir size correctly (maybe with bar chart visualization)
# TODO: use per directory history
# TODO: add yay
# TODO: install bat, delta

#!/bin/fish

# omf
curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf

# add path for some bins
set -U fish_user_paths ~/.local/bin $fish_user_paths

# shell coloring
# default text color is set in terminal
set fish_color_autosuggestion bbbbbb
set fish_pager_color_completion ffd52e
set fish_pager_color_description ffd52e
set fish_color_command ffe26e
set fish_color_param d9f5f8
set fish_color_error ff2929

# kubectl completion
mkdir -p ~/.config/fish/completions
cd ~/.config/fish
git clone https://github.com/evanlucas/fish-kubectl-completions
ln -s ../fish-kubectl-completions/completions/kubectl.fish completions/

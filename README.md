# archbook
My dotfiles, incl. Oh my Zsh and gitconfig.

Make sure to clone submodules: `git clone --recurse-submodules git@github.com:rappertomate/archbook.git`

## Zsh setup
Zsh related files are located in `zsh/` (duh). `zsh/nichoio` is a plugin for Oh-My-Zsh. Move it to `.oh-my-zsh/plugins`.

## Nvim setup

### MacOS

Preliminary steps:
* Install Nerd Font: `brew install font-hack-nerd-font`
* In Terminal which is used for Nvim (e.g. iTerm), apply Nerd Font

Then, copy the contents of `nvim/macos` to `~/.config/nvim`.

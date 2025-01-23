# archbook
My dotfiles, incl. Oh my Zsh and gitconfig.

## Zsh setup
Zsh related files are located in `zsh/` (duh). `zsh/nichoio` is a plugin for Oh-My-Zsh. Move it to `.oh-my-zsh/plugins`.

## Nvim setup

### MacOS

Preliminary steps:
* Install Nerd Font: `brew install font-hack-nerd-font`
* In Terminal which is used for Nvim (e.g. iTerm), apply Nerd Font
* Install lua.  FIXME: provide recommended lua install instructions, check if luarocks is also required
* Install nvim: `brew install neovim`
* Install npm: `brew install npm`
* Install dependencies recommended by telescope plugin: `brew install ripgrep`, `brew install fd`

Then, copy the contents of `nvim/macos` to `~/.config/nvim`.

Post setup steps:
* Treesitter might not be enabled for supported programming languages automatically. In Nvim, you may need to run `:TSEnable highlight` once ever to enable treesitter.

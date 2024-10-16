----------- KEY REMAPPINGS -----------

-- Move between windows
local function switch_window()
  vim.cmd('wincmd w') -- equivalent to <C-w>w
end

local map = vim.api.nvim_set_keymap
-- switch windows by just CTRL+W. Function callback is needed as workaround to surpress default CTRL+W behavior.
map("n", "<C-w>", "", {noremap = true, silent = true, callback = switch_window})

-- use SHIFT+ARROW_UP/SHIFT+ARROW_DOWN to move cursor fast
map('n', '<S-Up>', '30k', { noremap = true, silent = true })
map('v', '<S-Up>', '30k', { noremap = true, silent = true })
map('n', '<S-Down>', '30j', { noremap = true, silent = true })
map('v', '<S-Down>', '30j', { noremap = true, silent = true })

----------- VIM SETTINGS -----------

-- Global settings (o)
-- display spaces, tabs, trailing spaces etc.
vim.o.listchars = 'space:·,trail:-,nbsp:+,tab:▏ ,eol:↴'
vim.o.list = true

-- Editor settings (opt)
-- display relative paths in status line
vim.opt.statusline = "%{expand('%:.')}"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Window settings (wo)
vim.wo.number = true
-- use system clipboard for yank
vim.api.nvim_set_option("clipboard", "unnamed")

----------- NVIM CONFIG AND PLUGINS -----------

require("config.lazy")

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 40,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
})

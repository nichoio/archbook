-- global settings (o)
-- display spaces, tabs, trailing spaces etc.
vim.o.listchars = 'space:·,trail:-,nbsp:+,tab:▏ ,eol:↴'
vim.o.list = true

-- window settings (wo)
vim.wo.number = true

-- use system clipboard for yank
vim.api.nvim_set_option("clipboard", "unnamed")

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

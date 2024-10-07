-- display spaces, tabs, trailing spaces etc.
vim.o.listchars = 'space:·,trail:-,nbsp:+,tab:▏ ,eol:↴'
vim.o.list = true

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
    icons = {
        show = {
            folder = false,
        }
    }
  },
  filters = {
    custom = {"^\\.git"}
  },
})

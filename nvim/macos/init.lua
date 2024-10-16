----------- KEY REMAPPINGS -----------

-- Move between windows
local function switch_window()
  vim.cmd('wincmd w') -- equivalent to <C-w>w
end

local map = vim.api.nvim_set_keymap
-- switch windows by just CTRL+W. Function callback is needed as workaround to surpress default CTRL+W behavior.
map('n', '<C-w>', '', {noremap = true, silent = true, callback = switch_window})

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

-- Indent by using spaces instead of tabs
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Editor settings (opt)
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Window settings (wo)
vim.wo.number = true
-- use system clipboard for yank
vim.api.nvim_set_option('clipboard', 'unnamed')

----------- NVIM CONFIG AND PLUGINS -----------

require('config.lazy')

require('nvim-tree').setup({
  sort = {
    sorter = 'case_sensitive',
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


-- Obtain LSP name to display inside Lualine status bar
local function lsp_server_name()
  local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if next(buf_clients) == nil then
    return 'No LSP' -- Show when no LSP is attached
  end

  -- Collect the names of active LSP servers
  local server_names = {}
  for _, client in pairs(buf_clients) do
    table.insert(server_names, client.name)
  end
  return "LSP: " .. table.concat(server_names, ', ') -- Concatenate and return LSP names
end


require('lualine').setup({
    options = { theme = 'material' },
    -- Lualine organizes the status bar as sections a,b,c (left) and x,y,z (right)
    sections = {
        lualine_b = { 'diff' },
    -- display relative path. w/o lualine in pure nvim, use this instead: vim.opt.statusline = '%{expand("%:.")}' 
        lualine_c = { {'filename', path = 1} },
    -- display active LSP using above local function
        lualine_y = { lsp_server_name }
    }
})

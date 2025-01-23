-- init.lua.
-- Order of these settings matter!
-- It's best to have the general settings on top because they affect how Key remappings are interpreted.

----------- VIM SETTINGS -----------

-- Global variables (g)
-- remap leader key to space
vim.g.mapleader = " "

-- Global settings (o)
-- display spaces, tabs, trailing spaces etc.
vim.o.listchars = 'space:·,trail:￮,nbsp:+,tab:▏ ,eol:↴'
vim.o.list = true

-- Enable Gruvbox background
vim.o.background = "dark" -- or "light" for light mode

-- Indent by using spaces instead of tabs
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Editor settings (opt)
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmode = false  -- hide mode since we use lualine to display it
-- use thin blinking cursor everywhere. guicorsor settings are only partly applied by iTerm.
vim.opt.guicursor = "n-v-c-sm:ver25-blinkon1,i-ci-ve:ver25-blinkon1,r-cr-o:ver25-blinkon1"
-- 6 line gap to top/bottom of window when scrolling
vim.opt.scrolloff = 6
-- Vertical line to indicate 120 char length
vim.opt.colorcolumn = "120"

-- Window settings (wo)
vim.wo.number = true

-- API settings (api)
-- Change Git gutter color to green for added lines
vim.api.nvim_set_hl(0, 'GitGutterAdd', { fg='#009900' })
-- use system clipboard for yank
vim.api.nvim_set_option('clipboard', 'unnamed')

----------- KEY (RE)MAPPINGS -----------

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

-- map new vertical split and new tab
map('n', '<leader>s', ':vnew<CR>', { noremap = true, silent = true })
map('n', '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })

-- open telescope plugin
map('n', '<leader>g', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- open Git blame
map('n', '<leader>b', ':Git blame<CR>', { noremap = true, silent = true })

-- copy absolute path of current buffer
map('n', '<leader>p', ':let @+=@%<CR>', { noremap = true, silent = true })

-- increase vertical size of current split
map('n', '<leader>r', ':vertical resize +15<CR>', { noremap = true, silent = true })

-- Apply single indents in visual mode without leaving visual mode afterwards
map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- use q to toggle floating Neotree window. n is already used by 'next search result' and t by 'open in new tab' by Neotree itself 
map('n', 'q', ":lua require('neo-tree.command').execute({ position = 'float', toggle = true })<CR>", { noremap = true, silent = true })

----------- AUTOCMDS -----------
-- None currently

----------- NVIM CONFIG AND PLUGINS -----------

require('config.lazy')

require('neo-tree').setup {
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,  -- show gitignored, but faint
            never_show = { ".git" },  -- don't show those at all
        },
    },
    window = {
        position = "float",
        popup = {
            size = { height = "80%", width = "60%" },
            position = "50%",
        },
    }
}

require("telescope").setup {
    pickers = {
        live_grep = {
            additional_args = function(opts)
                return {"--hidden", "--glob=!.git/"}  -- search everywhere, except gitignored files and .git/
            end
        },
    },
    defaults = {
        wrap_results = true,  -- wrap left hand side search results
    }
}

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "lua", "python", "terraform" },

    highlight = {
        enable = true,
    },
}

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

-- Returns current cursor location and number of rows of current buffer in this format: current_row/no_of_rows:current_col
local function cursor_position()
    local current_row = vim.fn.line('.')
    local number_of_rows = vim.fn.line('$')
    local current_col = vim.fn.col('.')
    return string.format("%d/%d:%d", current_row, number_of_rows, current_col)
end

require('lualine').setup({
    options = { theme = 'material' },
    -- Lualine organizes the status bar as sections a,b,c (left) and x,y,z (right)
    sections = {
        -- display relative path. w/o lualine in pure nvim, use this instead: vim.opt.statusline = '%{expand("%:.")}'
        lualine_b = { {'filename', path = 1} },
        -- display Git diff status
        lualine_c = { { 'diff' } },
        -- display active LSP using above local function
        lualine_y = { lsp_server_name },
        -- display cursor location and number of rows
        lualine_z = { cursor_position }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = { {'filename', path = 1} },
        lualine_c = {},
        lualine_x = { cursor_position }  -- display cursor at x because in order to replace the default cursor display
    }
})


----------- COMMAND REMAPPINGS -----------

-- apply colorscheme
vim.cmd([[colorscheme gruvbox]])  -- must be executed after Lazy config is loaded so that the colorscheme plugin is already loaded

-- map :qt to close tab
vim.cmd('cabbrev qt tabclose') -- can't use nvim_create_user_command bc it only works with Uppercase remappings

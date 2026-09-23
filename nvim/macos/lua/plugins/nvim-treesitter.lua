return {
    'nvim-treesitter/nvim-treesitter', branch = "main",
    lazy = false,  -- main branch does not support lazy-loading
    build = ':TSUpdate',  -- update parsers when the plugin updates
}


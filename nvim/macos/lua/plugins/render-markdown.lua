return {
    'MeanderingProgrammer/render-markdown.nvim',
    tag = "v7.7.0",  -- v.7.7.8 causes bug "attempt to call method 'get_callout'"
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },  -- nvim-web-devicons is used for icon above code blocks
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
}

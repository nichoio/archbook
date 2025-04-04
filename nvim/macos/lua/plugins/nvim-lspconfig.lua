return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')

            -- Add LSPs to be enabled below. Note that the LSPs must be installed first by providing them in mason-lspconfig.lua

            lspconfig.pyright.setup({})
            lspconfig.terraformls.setup({})
            lspconfig.yamlls.setup({})
        end
    }
}

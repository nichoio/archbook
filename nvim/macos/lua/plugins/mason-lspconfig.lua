return {
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
	    -- Add desired LSPs here. Note that all LSPs here must also show up in nvim-lspconfig.lua to be enabled.
	    -- External dependencies:
	    -- yamlls: npm
            require('mason-lspconfig').setup({
                ensure_installed = { 'yamlls' },
                automatic_installation = true,
            })
        end
    }
}

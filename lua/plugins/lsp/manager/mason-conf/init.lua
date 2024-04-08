return {
    'williamboman/mason-lspconfig.nvim',
    config = function()
        require 'plugins.lsp.manager.mason-conf.conf'
    end,
}

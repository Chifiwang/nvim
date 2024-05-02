return {
    'williamboman/mason-lspconfig.nvim',
    -- lazy = true,
    -- event = 'BufEnter *.*',
    config = function()
        require 'plugins.lsp.manager.mason-conf.conf'
    end,
}

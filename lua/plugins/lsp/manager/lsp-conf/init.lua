return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
        require 'plugins.lsp.manager.lsp-conf.conf'
    end,
}

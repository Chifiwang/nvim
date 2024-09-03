return {
    'neovim/nvim-lspconfig',
    -- lazy = true,
    -- event = 'BufEnter *.*',
    dependencies = {
        -- { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
        require 'plugins.lsp.manager.lsp-conf.conf'
    end,
}

return {
    'VonHeikemen/lsp-zero.nvim',
    lazy = true,
    event = 'BufEnter *.*',
    config = function()
        require 'plugins.lsp.manager.lsp_zero.conf'
    end,
}

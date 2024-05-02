return {
    'hrsh7th/nvim-cmp',
    -- lazy = true,
    -- event = 'BufEnter *.*',
    dependencies = {
        require 'plugins.lsp.cmp.nvim-cmp-lsp'
    },
    config = function()
        require 'plugins.lsp.cmp.nvim-cmp.conf'
    end,
}

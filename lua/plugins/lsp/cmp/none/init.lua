return {
    'nvimtools/none-ls.nvim',
    -- lazy = true,
    -- event = 'BufEnter *.*',
    config = function()
        require 'plugins.lsp.cmp.none.conf'
    end,
}

return {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    lazy = true,
    event = 'BufEnter *.*',
    config = function()
        require('mason-tool-installer').setup { ensure_installed = {
            'lua_ls',
            'pyright'
        }}
    end,
}

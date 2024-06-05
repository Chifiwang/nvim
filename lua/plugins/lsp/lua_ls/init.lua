return {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files,
                -- see also https://github.com/LuaLS/lua-language-server/wiki/Libraries#link-to-workspace .
                -- Lua-dev.nvim also has similar settings for lua ls, https://github.com/folke/neodev.nvim/blob/main/lua/neodev/luals.lua .
                library = {
                    vim.fn.stdpath("data") .. "/lazy/emmylua-nvim",
                    vim.fn.stdpath("config"),
                },
                maxPreload = 2000,
                preloadFileSize = 50000,
            },
        }
    }
}

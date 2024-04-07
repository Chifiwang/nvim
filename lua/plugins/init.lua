return {
    -- Core
    require 'plugins.core.dependencies',
    require 'plugins.core.colourscheme',
    require 'plugins.core.treesitter',
    -- require 'plugins.core.filemanager',
    require 'plugins.core.telescope',
    require 'plugins.core.harpoon',
    require 'plugins.core.todo-comments',
    require 'plugins.core.sleuth',
    require 'plugins.core.comments',
    require 'plugins.core.lualine',
    -- require 'plugins.core.ui',
    -- require 'plugins.core.neodev', -- adds nvim support to lsp
    -- Git
    require 'plugins.git.gitsigns',
    require 'plugins.git.fugitive',
    -- LSP
    require 'plugins.lsp.manager.lsp_zero',
    require 'plugins.lsp.manager.lsp-conf',
}

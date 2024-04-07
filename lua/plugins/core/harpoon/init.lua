return  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    -- dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require 'plugins.core.harpoon.conf'
    end,
  }

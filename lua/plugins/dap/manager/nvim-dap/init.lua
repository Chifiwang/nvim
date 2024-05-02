return {
    'mfussenegger/nvim-dap',
    -- lazy = true,
    -- event = 'BufEnter *.*',
    dependencies = {
        {
            'rcarriga/nvim-dap-ui',
            dependencies = {"nvim-neotest/nvim-nio"},

        }
    },
    config = function ()
        require 'plugins.dap.manager.nvim-dap.conf'
    end
}

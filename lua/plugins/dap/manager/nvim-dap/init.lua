return {
    'mfussenegger/nvim-dap',
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

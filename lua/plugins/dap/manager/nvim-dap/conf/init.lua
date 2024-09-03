local dap, dapui = require("dap"), require("dapui")
local home = os.getenv("HOME")

dapui.setup()

-- Enable DAP UI
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- Style Breakpoint
vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#ff2929', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text = '⦿', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = '', numhl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = '', numhl = 'DapStopped' })

-- Set Keymaps
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<leader>dr", dap.continue, {})
vim.keymap.set("n", "<leader>dn", dap.step_over, {})


-- Debuggers
-- dap.adapters.lldb = {
--   type = 'executable',
--   command = '$(brew --prefix llvm)/bin/lldb-dap', -- adjust as needed, must be absolute path
--   name = 'lldb'
-- }

-- dap.adapters.codelldb = {
--   type = 'server',
--   port = '13000',
--   executable = {
--     command = home .. '/.local/share/nvim/mason/bin/codelldb',
--     args = {'--port', '13000'},
--   }
-- }
--
-- dap.configurations.cpp = {
--   {
--     name = 'Launch file',
--     type = 'codelldb',
--     request = 'launch',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--
--     -- 💀
--     -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
--     --
--     --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
--     --
--     -- Otherwise you might get the following error:
--     --
--     --    Error on launch: Failed to attach to the target process
--     --
--     -- But you should be aware of the implications:
--     -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
--     -- runInTerminal = false,
--   },
-- }
--
-- dap.configurations.c = dap.configurations.cpp
--
-- dap.configurations.rust = {
--   {
--     name = 'Launch',
--     type = 'lldb',
--     request = 'launch',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--
--     -- 💀
--     -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
--     --
--     --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
--     --
--     -- Otherwise you might get the following error:
--     --
--     --    Error on launch: Failed to attach to the target process
--     --
--     -- But you should be aware of the implications:
--     -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
--     -- runInTerminal = false,
--
--     initCommands = function()
--       -- Find out where to look for the pretty printer Python module
--       local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))
--
--       local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
--       local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'
--
--       local commands = {}
--       local file = io.open(commands_file, 'r')
--       if file then
--         for line in file:lines() do
--           table.insert(commands, line)
--         end
--         file:close()
--       end
--       table.insert(commands, 1, script_import)
--
--       return commands
--     end,
--     -- ...,
--   }
-- }
-- -- local dap = require('dap')
-- local codelldb = require('mason-registry').get_package('codelldb'):get_install_path() .. '/codelldb'
-- dap.adapters.codelldb = {
--     type = 'server',
--     port = '${port}',
--     executable = {
--         command = codelldb,
--         args = { '--port', '${port}' },
--     },
-- }
-- dap.configurations.cpp = {
--     {
--         name = 'Debug with codelldb',
--         type = 'codelldb',
--         request = 'launch',
--         program = function()
--             return vim.fn.input({
--                 prompt = 'Path to executable: ',
--                 default = vim.fn.getcwd() .. '/',
--                 completion = 'file',
--             })
--         end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = false,
--     },
-- }
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = {
--     {
--         name = 'Debug with codelldb',
--         type = 'codelldb',
--         request = 'launch',
--         program = function()
--             return vim.fn.input({
--                 prompt = 'Path to executable: ',
--                 default = vim.fn.getcwd() .. '/',
--                 completion = 'file',
--             })
--         end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = false,
--     },
--     {
--         name = 'Debug with rust-tools',
--         type = 'rt_lldb',
--         request = 'launch',
--         program = function()
--             return vim.fn.input({
--                 prompt = 'Path to executable: ',
--                 default = vim.fn.getcwd() .. '/',
--                 completion = 'file',
--             })
--         end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = false,
--         args = {},
--     },
-- }

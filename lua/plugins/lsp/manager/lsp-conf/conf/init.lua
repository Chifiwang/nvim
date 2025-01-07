local lsp_config = require("lspconfig")
-- local utils = require("core.utils")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_zero = require("lsp-zero")
lsp_zero.extend_lspconfig()
lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
	local opts = { buffer = bufnr }

	vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
	vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
	vim.keymap.set("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")

	-- if client.server_capabilities.documentFormattingProvider then
	--     vim.keymap.set("n", "<space>f", vim.lsp.buf.format, { desc = "format code" })
	-- end

	if client.server_capabilities.documentHighlightProvider then
		vim.cmd([[
          hi! link LspReferenceRead Visual
          hi! link LspReferenceText Visual
          hi! link LspReferenceWrite Visual
      ]])

		local gid = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
		vim.api.nvim_create_autocmd("CursorHold", {
			group = gid,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.document_highlight()
			end,
		})

		vim.api.nvim_create_autocmd("CursorMoved", {
			group = gid,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.clear_references()
			end,
		})
	end
end)

lsp_config.intelephense.setup({})
local configure = function(n)
	local conf = require(n)
	conf.capabilities = capabilities
	return conf
end

-- [[ Init LSPs ]]
lsp_config.lua_ls.setup(configure("plugins.lsp.lua_ls"))
lsp_config.pyright.setup(configure("plugins.lsp.pyright"))
lsp_config.clangd.setup(configure("plugins.lsp.clangd"))
lsp_config.rust_analyzer.setup(configure("plugins.lsp.rust_analyzer"))
lsp_config.texlab.setup(configure("plugins.lsp.texlab"))
-- lsp_config.asm_lsp.setup(configure("plugins.lsp.asm_lsp"))
-- lsp_config.jdtls.setup({
-- 	handlers = {
-- 		["language/status"] = function(_, result)
-- 			vim.print("***")
-- 		end,
-- 		["$/progress"] = function(_, result, ctx)
-- 			vim.print("---")
-- 		end,
-- 	},
-- })
-- lsp_zero.preset({}).skip_server_setup({'jdtls'})
-- [[ Keymaps ]]
-- vim.keymap.set('n', '<s-k>', vim.lsp.buf.hover, {})

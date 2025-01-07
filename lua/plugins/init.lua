return {
	-- Core
	require("pies"),
	require("plugins.core.colourscheme"),
	require("plugins.core.treesitter"),
	require("plugins.core.filemanager"),
	require("plugins.core.telescope"),
	require("plugins.core.harpoon"),
	require("plugins.core.todo-comments"),
	require("plugins.core.sleuth"),
	require("plugins.core.comments"),
	require("plugins.core.lualine"),
	require("plugins.core.telescope-ui-select"),
	-- require("plugins.core.hexokinase"),
	require("plugins.core.mini"),
	-- require("plugins.core.neodev"), -- adds nvim support to lsp
	require("plugins.core.templates"),
	-- Git
	require("plugins.git.gitsigns"),
	require("plugins.git.fugitive"),
	-- LSP
	-- require("plugins.lsp.manager.lsp_zero"),
	-- require("plugins.lsp.manager.lsp-conf"),
	-- require("plugins.lsp.manager.mason"),
	-- require("plugins.lsp.manager.installer"),
	-- require("plugins.lsp.manager.mason-conf"),
	-- Java Lsp
	-- require("plugins.lsp.java.jdtls"),
	-- CMP
	-- require("plugins.lsp.cmp.none"),
	-- require("plugins.lsp.cmp.nvim-cmp"),
	-- require("plugins.lsp.cmp.luasnip"),
	-- require("plugins.lsp.cmp.nvim-cmp-lsp"),
	-- DAP
	-- require("plugins.dap.lldb"),
	-- require("plugins.dap.manager.nvim-dap"),
	-- require("plugins.dap.manager.mason-nvim-dap"),
	-- LATEX
	-- require 'plugins.latex.vimtex',
	-- "evesdropper/luasnip-latex-snippets.nvim",
	-- TMUX
	-- require("plugins.tmux.vim-tmux-nav"),
	-- Discord
	require("plugins.discord.presence"),
}

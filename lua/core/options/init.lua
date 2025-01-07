-- [[ Shorthands ]]
-- Set some useful shorthands
local opt = vim.opt
local key = vim.keymap
local api = vim.api
local tab_size = 4

-- [[ Leader Key ]]
-- Set <Space> as <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Tabs ]]
-- Set some basic tab settings
opt.tabstop = tab_size
opt.shiftwidth = tab_size
opt.softtabstop = tab_size
opt.expandtab = true
opt.smarttab = true

-- [[ Line Numbers ]]
-- Set Line Numbers
-- Set Relative Line Numbers
-- Set and Style signcolumn
-- Set scrolloff
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
vim.cmd([[highlight clear signcolumn]])
opt.scrolloff = 10

-- [[ Options ]]
-- Some basic options

-- Ability to use mouse
opt.mouse = "a"

-- Make block cursor
opt.guicursor = ""

-- Enable undofile
opt.undofile = true

-- Disable mode in statusline
opt.showmode = false

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Configure splits
opt.splitright = false
opt.splitbelow = false

-- Sets whitespace display chars
opt.list = true
opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Preview substitutions
opt.inccommand = "split"

-- Cursor line
opt.cursorline = true

-- Line length indicator
-- Set colour
opt.colorcolumn = "80"
vim.cmd([[highlight ColorColumn ctermbg=0 guibg='#1f212e']])

-- Wrap Words
opt.wrap = false
opt.linebreak = true

-- Allow for visual blocks to select true squares at end of lines
key.set("n", "q", "<c-v>", { noremap = true })
opt.virtualedit = "block"
-- [[ Searching ]]
-- Make searches case insensity
-- Make case sensitive searches case-sensitive
-- highlight searches
-- Set cancel search to <Esc>
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
key.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- [[ Auto Commands]]
-- Make highlight on [y]ank work
api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when [y]anking text",
	group = api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

api.nvim_create_autocmd("BufWritePre", {
	group = api.nvim_create_augroup("format", { clear = true }),
	-- buffer = bufnr,
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

api.nvim_create_autocmd("InsertEnter", {
	desc = "Use absolute linenumbers in insert mode",
	group = api.nvim_create_augroup("numbering", { clear = false }),
	pattern = { "*" },
	command = [[:set norelativenumber]],
})

api.nvim_create_autocmd("InsertLeave", {
	desc = "Use absolute relative linenumbers when not in insert mode",
	group = api.nvim_create_augroup("numbering", { clear = false }),
	pattern = { "*" },
	command = [[:set relativenumber]]
})

-- separate .h files into c files
api.nvim_create_autocmd("BufRead", {
	pattern = {"*.h"},
	command = [[:setlocal filetype=c]]
})

api.nvim_create_autocmd("BufNewFile", {
	pattern = {"*.h"},
	command = [[:setlocal filetype=c]]
})

-- [[ Custom Keymaps ]]
-- Get current file path
key.set("n", "<leader>@<cr>", function()
	vim.cmd([[let @* = expand('%:p')]])
end, { noremap = true })

-- Get current directory path
key.set("n", "<leader>@*<cr>", function()
	vim.cmd([[let @* = expand('%:p:h')]])
end, { noremap = true })

key.set({ "n", "v" }, "<leader>y", '"*y', { noremap = true })
key.set({ "n", "v" }, "<leader>p", '"*p', { noremap = true })

-- Vinegar style file explorer
key.set("n", "-", "<cmd>Ex<CR>", { noremap = true })

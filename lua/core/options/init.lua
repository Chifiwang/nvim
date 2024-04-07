
-- [[ Shorthands ]]
-- Set some useful shorthands
local opt = vim.opt
local key = vim.keymap
local api = vim.api
local tab_size = 4

-- [[ Leader Key ]]
-- Set <Space> as <leader>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
opt.signcolumn = 'yes'
vim.cmd [[highlight clear signcolumn]]
opt.scrolloff = 10

-- [[ Options ]]
-- Some basic options

-- Ability to use mouse
opt.mouse = 'a'

-- Make block cursor
opt.guicursor = ''

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
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions
opt.inccommand = 'split'

-- Cursor line
opt.cursorline = true

-- Line length indicator
-- Set colour
opt.colorcolumn = '80'
vim.cmd [[highlight ColorColumn ctermbg=0 guibg='#1f212e']]

-- Wrap Words
opt.wrap = true
opt.linebreak = true

-- [[ Searching ]]
-- Make searches case insensity
-- Make case sensitive searches case-sensitive
-- highlight searches
-- Set cancel search to <Esc>
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
key.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- [[ Auto Commands]]
-- Make highlight on [y]ank work
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when [y]anking text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
  end,
})

-- [[ Custom Keymaps ]]
-- Get current file path
key.set ('n', '<leader>@<cr>',
    function ()
        vim.cmd [[let @* = expand('%:p')]]
    end,
    { noremap = true }
)

-- Get current directory path
key.set('n', '<leader>@*<cr>',
    function ()
        vim.cmd [[let @* = expand('%:p:h')]]
    end,
    { noremap = true }
)

-- Vinegar style file explorer
key.set('n', '-', '<cmd>Ex<CR>', { noremap = true })
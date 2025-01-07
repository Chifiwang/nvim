vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "texshop"
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_quickfix_enabled = 0
vim.g.vimtex_view_texshop_activate = 1
-- vim.g.vimtex_latexmk_background = 0
vim.g.vimtex_view_automatic = 0

vim.keymap.set("n", "<localleader>ll", "<cmd>VimtexCompileSS<cr>", { noremap = true })

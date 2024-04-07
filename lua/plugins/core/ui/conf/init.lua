require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      -- ["vim.lsp.buf.hover"] = true,
      -- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
    -- hover = {
    --   enabled = true,
    --   silent = false,
    --   view = nil,
    --   ---@type NoiceViewOptions
    --   opts = {},
    -- },
  },
  -- you can enable a preset for easier configuration
  cmdline = {
    view = "cmdline",
    format = {
      search_down = {
        view = "cmdline",
      },
      search_up = {
        view = "cmdline",
      },
    },
  },
})

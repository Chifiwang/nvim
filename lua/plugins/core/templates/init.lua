local home = os.getenv("HOME")

return {
    -- "glepnir/template.nvim",
    "chifiwang/nvim.templates",
    -- cmd = { "Template", "TemProject" },
    config = function()
        require("template").setup({
            -- config in there
            temp_dir = home .. "/.config/nvim/templates",
            email = "chifiwang@gmail.com",
        })
        require("telescope").load_extension("find_template")
        vim.keymap.set("n", "<leader>ft", function()
            vim.cmd("Telescope find_template type=insert")
        end, { noremap = true })
    end,
}

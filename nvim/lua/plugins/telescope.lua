return {
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            -- Disable LazyVim's default keymaps if they conflict
            { "<leader>ff",      false },
            { "<leader><space>", false },

            -- Your custom keymaps
            { "<leader>pf",      "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<C-p>",           "<cmd>Telescope git_files<cr>",  desc = "Git Files" },
            {
                "<leader>ps",
                function()
                    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
                end,
                desc = "Grep"
            },
        },
        opts = {
            defaults = {
                -- Disable treesitter highighting in previewer
                preview = {
                    treesitter = false,
                }
            }
        }
    },
}

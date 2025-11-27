return {
    -- Neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            {
                "<leader>fe",
                "<cmd>Neotree focus<cr>",
                desc = "Focus Explorer",
            },
        },
    },

    -- Harpoon
    {
        "theprimeagen/harpoon",
        keys = {
            { "<leader>a", function() require("harpoon.mark").add_file() end,        desc = "Harpoon Add" },
            { "<C-e>",     function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon Menu" },
            { "<C-h>",     function() require("harpoon.ui").nav_file(1) end,         desc = "Harpoon File 1" },
            { "<C-t>",     function() require("harpoon.ui").nav_file(2) end,         desc = "Harpoon File 2" },
            { "<C-n>",     function() require("harpoon.ui").nav_file(3) end,         desc = "Harpoon File 3" },
            { "<C-s>",     function() require("harpoon.ui").nav_file(4) end,         desc = "Harpoon File 4" },
        },
    },

    -- Undotree
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "Undotree" },
        },
    },

    -- Refactoring
    {
        "theprimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
        end,
        keys = {
            { "<leader>rr", function() require('refactoring').select_refactor() end, mode = "v", desc = "Refactor" },
        },
    },

    -- Treesitter context
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = { mode = "cursor", max_lines = 3 },
    },

    -- Trouble (LazyVim includes this, just configure)
    {
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },

    -- Zen mode
    {
        "folke/zen-mode.nvim",
        keys = {
            { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
        },
    },

    -- Cloak (for .env files)
    {
        "laytan/cloak.nvim",
        ft = { "env", "sh" },
        config = function()
            require("cloak").setup()
        end,
    },

    -- Cellular Automaton
    {
        "eandrju/cellular-automaton.nvim",
        keys = {
            { "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make it rain" },
        },
    },

    -- Copilot
    {
        "github/copilot.vim",
        event = "InsertEnter",
    },
}

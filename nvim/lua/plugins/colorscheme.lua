return {
    {
        'loctvl842/monokai-pro.nvim',
        config = function()
            require("monokai-pro").setup({
                filter = "ristretto",
                day_night = {
                    enable = false,
                    day_filter = "ristretto",
                    night_filter = "ristretto"
                },
                background_clear = {
                    "toggleterm",
                    "renamer",
                    "telescope",
                    "notify"
                }
            })

            vim.api.nvim_set_hl(0, "NeoTreeDimText", { fg = "#939393" })
        end
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "monokai-pro"
        }
    }
}

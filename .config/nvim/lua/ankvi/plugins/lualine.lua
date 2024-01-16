return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        -- "folke/tokyonight.nvim",
        "catppuccin",
    },
    config = function()
        require("lualine").setup({
            options = {
                theme = "catppuccin"
            }
        })
    end
}

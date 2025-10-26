return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    -- "folke/tokyonight.nvim",
    "catppuccin",
    -- "rebelot/kanagawa.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        -- theme = "kanagawa",
        theme = "catppuccin",
      },
      sections = {
        lualine_b = { "diagnostics" },
        lualine_x = { "filetype" },
        lualine_y = {},
      },
    })
  end,
}

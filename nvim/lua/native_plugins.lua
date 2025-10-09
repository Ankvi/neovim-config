vim.pack.add({
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  { src = "saghen/blink.cmp", version = "v1.6.0" },
  "nvim-mini/mini.pairs",
  "AckslD/nvim-neoclip.lua",
  "numToStr/Comment.nvim",
  "folke/todo-comments.nvim",
  "rcarriga/nvim-dap-ui",
  "mfussenegger/nvim-dap",
  "folke/lazydev.nvim",
  "mxsdev/nvim-dap-vscode-js",
  "nvim-neotest/nvim-nio",
  "nvim-lualine/lualine.nvim",
  "stevearc/oil.nvim",
  "lambdalisue/suda.vim",
  "ThePrimeagen/vim-be-good",
  { src = "catppuccin/nvim", name = "catppuccin" },
})

require("custom.autocomplete.blink")
require("mini.pairs").setup()
require("neoclip").setup()
require("Comment").setup()
require("custom.dap")
require("lualine").setup({
  options = {
    theme = "catppuccin",
  },
  sections = {
    lualine_b = { "diagnostics" },
    lualine_x = { "filetype" },
    lualine_y = {},
  },
})

require("custom.oil")
require("catppuccin").setup({
  transparent_background = true,
  integrations = {
    blink_cmp = true,
  },
  float = { solid = true, transparent = false },
})
vim.cmd.colorscheme("catppuccin")

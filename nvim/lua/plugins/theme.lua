return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        blink_cmp = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
-- return {
--   "rebelot/kanagawa.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("kanagawa").setup()
--     vim.cmd.colorscheme("kanagawa")
--   end,
-- }
-- -- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {},
--     config = function()
--         vim.cmd.colorscheme("tokyonight-night")
--     end
-- }
--
-- return {
--     "rose-pine/neovim",
-- name = "rose-pine",
--	config = function()
--   vim.cmd.colorscheme("rose-pine")
--	end
-- }

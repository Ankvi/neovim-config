return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		-- "folke/tokyonight.nvim",
		"catppuccin",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
			},
		})
	end,
}

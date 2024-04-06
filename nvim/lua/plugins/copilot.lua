return {
	"github/copilot.vim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local async = require("plenary.async")
		async.void(function()
			vim.cmd("Copilot setup")
		end)
	end,
}

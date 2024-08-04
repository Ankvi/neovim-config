return {
	"rest-nvim/rest.nvim",
	ft = "http",
	config = function()
		local rest = require("rest-nvim")
		rest.setup()
		vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>")
		vim.keymap.set("n", "<leader>rl", "<cmd>Rest run last<CR>")
	end,
}

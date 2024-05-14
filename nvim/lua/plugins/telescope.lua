return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
        require("custom.telescope")
	end,
}

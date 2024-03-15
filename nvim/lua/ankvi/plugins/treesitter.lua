return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-context",
	},
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"arduino",
                "bash",
				"c",
                "c_sharp",
				"cpp",
                "css",
                "dockerfile",
                "go",
                "gomod",
                "gosum",
                "html",
                "ini",
                "json",
                "jsonc",
                "javascript",
				"lua",
                "make",
				"markdown",
				"python",
				"typescript",
				"tsx",
				"rust",
                "tmux",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
			},
			highlight = { enable = true },
			indent = { enable = true },
			sync_install = false,
			auto_install = true,
			additional_vim_regex_highlighting = false,
			ignore_install = {},
			modules = {},
			autotag = {
				enable = true,
			},
		})
	end,
}

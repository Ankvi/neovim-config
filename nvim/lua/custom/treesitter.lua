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
		"hyprlang",
		"ini",
		"json",
		"jsonc",
		"javascript",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
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
	highlight = {
		enable = true,
		use_languagetree = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	modules = {},
})
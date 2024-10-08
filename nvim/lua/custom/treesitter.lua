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
		"toml",
		"vim",
		"vimdoc",
		"xml",
		"yaml",
	},

	sync_install = false,
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	indent = {
		enable = true,
	},
	modules = {},
})

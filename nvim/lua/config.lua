vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.titlestring = "neovim %{getcwd()}"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.clipboard:append("unnamedplus")
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.updatetime = 50

vim.opt.conceallevel = 1

--vim.opt.colorcolumn = "80"
vim.g.mapleader = " "

vim.filetype.add({
	pattern = {
		[".*/sway/config.d/.*%.conf"] = "swayconfig",
		[".*/tmux/.*%.conf"] = "tmux",
		[".*/hypr/.*%.conf"] = "hyprlang",
		[".*%.resx"] = "xml",
		[".*.http"] = "http",
		[".*.zmk"] = "dts",
		[".*.dtsi.min"] = "dts",
		[".*.keymap"] = "dts",
	},
})

local signs = {
	ERROR = " ",
	WARN = " ",
	HINT = "󰌵",
	INFO = " ",
}

vim.diagnostic.config({
	virtual_text = {
		prefix = function(diagnostic)
			return signs[vim.diagnostic.severity[diagnostic.severity]]
		end,
	},
    float = {
        source = true
    }
})

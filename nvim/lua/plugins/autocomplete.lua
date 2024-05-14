local has_words_before = function()
	---@diagnostic disable-next-line: deprecated
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "zbirenbaum/copilot-cmp" },
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip" },
		},
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = {},
		},
	},
	config = function()
        require("custom.autocomplete")
	end,
}

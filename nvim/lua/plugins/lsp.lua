return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "lbrayner/vim-rzip" },
			{
				"Hoffs/omnisharp-extended-lsp.nvim",
			},
			{
				"Decodetalkers/csharpls-extended-lsp.nvim",
			},
			{
				"b0o/schemastore.nvim",
			},
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"williamboman/mason.nvim",
				dependencies = {
					"williamboman/mason-lspconfig.nvim",
				},
			},
		},
		config = function()
			require("custom.lsp")
		end,
	},

	-- Rust things
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup()
		end,
	},

	-- TypeScript things
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("typescript-tools").setup({
				single_file_support = false,
				root_dir = require("lspconfig.util").root_pattern(".git"),
			})
		end,
	},
}

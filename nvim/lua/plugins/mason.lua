return {
	"williamboman/mason.nvim",

	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	},

	build = function()
		pcall(vim.api.nvim_command, "MasonUpdate")
	end,

	config = function()
		local servers = require("custom.lsp.servers")

		require("mason").setup()
		require("mason-lspconfig").setup({
            ensure_installed = {
                "omnisharp@v1.39.8"
            },
			automatic_installation = {
				exclude = servers.exclude_install,
			},
		})

		local tools = {--vim.tbl_extend("keep", vim.tbl_keys(servers.get_server_configs()), {
			-- LINTERS --
			"actionlint",
			"cpplint",
			"markdownlint",
			"pylint",
			"shellcheck",
            "stylelint",

			-- FORMATTERS --
			"black",
			"clang-format",
			"prettierd",
			"stylua",
            "shfmt",

            -- DEBUGGING --
            "js-debug-adapter"
		}

		require("mason-tool-installer").setup({
			ensure_installed = tools,
		})
	end,
}

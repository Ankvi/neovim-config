return {
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
		local servers = require("plugins.lsp.lspconfig.servers")
		local configs = servers.get_server_configs()

		-- vim.api.nvim_create_autocmd("LspAttach", {
		-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		-- 	callback = function(ev)
  --               local lsp_functions = require("plugins.lsp.lspconfig.functions")
  --               lsp_functions.on_attach({}, ev.buf)
		-- 	end,
		-- })

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local common_setup_args = {
			capabilities = capabilities,
            -- on_attach = require("plugins.lsp.lspconfig.functions").on_attach
		}

		local lspconfig = require("lspconfig")
		for name, opts in pairs(configs) do
			lspconfig[name].setup(vim.tbl_extend("force", common_setup_args, opts))
		end
	end,
}

return {
	-- "jmederosalvarado/roslyn.nvim",
	-- dependencies = {
	-- 	{ "neovim/nvim-lspconfig" },
	-- 	{ "hrsh7th/cmp-nvim-lsp" },
	-- },
	-- config = function()
	-- 	local roslyn = require("roslyn")
	-- 	local on_attach = require("plugins.lsp.lspconfig.functions").on_attach
	-- 	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	-- 	roslyn.setup({
	-- 		on_attach = function(client, bufnr)
	-- 			on_attach(client, bufnr)
	-- 		end,
	-- 		capabilities = capabilities,
	-- 	})
	-- end,





	-- {
	-- 	"iabdelkareem/csharp.nvim",
	-- 	dependencies = {
	-- 		"williamboman/mason.nvim", -- Required, automatically installs omnisharp
	-- 		"Tastyep/structlog.nvim", -- Optional, but highly recommended for debugging
	-- 	},
	-- 	config = function()
	-- 		require("csharp").setup({
	--                lsp = {
	--                    cmd_path = true
	--                }
	--            })
	-- 	end,
	-- },
}

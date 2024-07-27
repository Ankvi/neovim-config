local conform = require("conform")
local conform_util = require("conform.util")
-- local lspconfig_util = require("lspconfig.util")
--
-- local biome_or_prettierd = function(bufnr)
-- 	-- local biomeCheck = lspconfig_util.root_pattern("biome.json")
-- 	if conform.get_formatter_info("biome", bufnr).available then
-- 		return { "biome-check" }
-- 	else
-- 		return { "prettierd", "prettier" }
-- 	end
-- end
--
-- local formatter_overrides = {
--     ["biome-check"] = {
--         require_cwd = true
--     },
--     biome = {
--         require_cwd = true
--     }
-- }
--
conform.setup({
	formatters_by_ft = {
		sh = { "shfmt" },
		markdown = { "prettierd", "prettier" },
		javascript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
		typescript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
		-- javascript = biome_or_prettierd,
		-- javascriptreact = biome_or_prettierd,
		-- typescript = biome_or_prettierd,
		-- typescriptreact = biome_or_prettierd,
		css = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		json = { "biome-check", "prettierd", "prettier", stop_after_first = true },
		jsonc = { "biome-check" },
		-- json = biome_or_prettierd,
		-- jsonc = biome_or_prettierd,
		yaml = { "prettierd", "prettier" },
		lua = { "stylua" },
		python = { "isort", "black" },
		cs = { "csharpier" },
	},
	formatters = {
		["biome-check"] = {
			require_cwd = true,
		},
		biome = {
			require_cwd = true,
		},
	},
})

vim.keymap.set({ "n", "v" }, "<F3>", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 2000,
	})
end)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = args.buf,
			callback = function()
				-- Format the code before you run fix usings
				-- vim.lsp.buf.format({ timeout = 1000, async = false })

				-- If the file is C# then run fix usings
				-- if vim.bo[0].filetype == "cs" then
				-- 	require("csharp").fix_usings()
				-- end
			end,
		})
	end,
})

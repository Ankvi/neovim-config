local M = {}

function M.on_attach(client, bufnr)
	local opts = { buffer = bufnr, remap = true }

	local telescope = require("telescope.builtin")
	local previewer_opts = {
		entry_maker = require("ankvi.plugins.telescope.customEntry").gen_from_quickfix(opts),
	}

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gi", telescope.lsp_implementations, opts)
	vim.keymap.set("n", "gr", function()
		telescope.lsp_references(previewer_opts)
	end, opts)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "ød", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "æd", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.keymap.set("i", "<C-f>", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

return M

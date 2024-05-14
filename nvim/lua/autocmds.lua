vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local lsp_functions = require("custom.lsp.functions")
		lsp_functions.on_attach({}, ev.buf)
	end,
})

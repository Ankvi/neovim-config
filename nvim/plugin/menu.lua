local group = vim.api.nvim_create_augroup("nvim_popupmenu", { clear = false })
vim.api.nvim_create_autocmd("MenuPopup", {
    pattern = "*",
    group = group,
    desc = "Popup menu overrides",
    callback = function()
        if vim.lsp.get_clients({ bufnr = 0 })[1] then
            vim.cmd([[
                anoremenu PopUp.Definition <cmd>lua vim.lsp.buf.definition()<CR>
                anoremenu PopUp.References <cmd>Telescope lsp_references<CR>
            ]])
        end

        local urls = require("vim.ui")._get_urls()
        if vim.startswith(urls[1], "http") then
            vim.cmd([[
                amenu PopUp.URL gx
            ]])
        end
    end,
})

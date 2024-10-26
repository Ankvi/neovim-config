local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        sh = { "shfmt" },
        markdown = { "prettierd", "prettier" },
        javascript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        typescript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        css = { "biome-check", "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        json = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        cs = { "csharpier" },
        xml = { lsp_format = "never" },
    },
    formatters = {
        ["biome-check"] = {
            require_cwd = true,
        },
        biome = {
            require_cwd = true,
        },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
})

local skip_on_save = {
    ["csharpier"] = true,
}

local augroup = vim.api.nvim_create_augroup("CustomFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format on save",
    pattern = "*",
    group = augroup,
    callback = function(args)
        local formatters_for_buffer = conform.list_formatters(args.buf)
        for _, formatter in ipairs(formatters_for_buffer) do
            if skip_on_save[formatter.name] == true then
                return
            end
        end

        conform.format({
            bufnr = args.buf,
        })
    end,
})

vim.keymap.set({ "n", "v" }, "<F3>", function()
    conform.format({
        async = false,
        timeout_ms = 2000,
    })
end)

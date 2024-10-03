local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        sh = { "shfmt" },
        markdown = { "prettierd", "prettier" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        -- javascript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        -- javascriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        -- typescript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        -- typescriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        -- css = { "biome-check", "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        json = { "prettierd", "prettier", stop_after_first = true, lsp_format = "never" },
        -- json = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        -- jsonc = { "biome-check" },
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
        prettier = {
            require_cwd = true,
        },
        prettierd = {
            require_cwd = true,
        },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    format_on_save = {
        timeout_ms = 1000,
    },
})

-- vim.api.nvim_create_autocmd("BufWritePre")

vim.keymap.set({ "n", "v" }, "<F3>", function()
    conform.format({
        async = false,
        timeout_ms = 2000,
    })
end)

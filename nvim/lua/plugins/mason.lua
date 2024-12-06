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
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = true,
        })

        local tools = { --vim.tbl_extend("keep", vim.tbl_keys(servers.get_server_configs()), {
            -- LSPs
            "arduino_language_server",
            "bashls",
            "cssls",
            "html",
            "jsonls",
            "lemminx",
            "lua_ls",
            "omnisharp",
            "powershell_es",
            "pyright",
            "pylsp",
            "tailwindcss",
            "vimls",
            "vtsls",
            "yamlls",

            -- LINTERS --
            "actionlint",
            "cpplint",
            "markdownlint",
            "pylint",

            -- FORMATTERS --
            "black",
            "clang-format",
            "prettierd",
            "stylua",
            "shfmt",
            "csharpier",
            "yamlfmt",

            -- DEBUGGING --
            "js-debug-adapter",
        }

        require("mason-tool-installer").setup({
            ensure_installed = tools,
        })
    end,
}

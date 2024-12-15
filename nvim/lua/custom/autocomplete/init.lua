local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

require("luasnip.loaders.from_vscode").lazy_load()
local window = require("custom.autocomplete.window")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
cmp.setup({
    -- completion = {
    --     -- completeopt = "menu,menuone",
    --     completeopt = "menu,menuone,noinsert",
    -- },
    window = window.default,
    formatting = require("custom.autocomplete.formatting"),
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = require("custom.autocomplete.mappings"),
    sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lsp_signature_help" },
    },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
    -- mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    window = window.cmdline,
    sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
    }),
})

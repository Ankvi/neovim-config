return {
    {
        "saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",

        version = "v0.*",

        --- @module 'blink.cmp'
        --- @type blink.cmp.Config
        opts = {
            keymap = { preset = "default" },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },

            completion = {
                accept = {
                    auto_brackets = { enabled = true },
                },
                -- menu = { border = "single" },
                -- documentation = { window = { border = "single" } },
            },

            signature = { enabled = true },
            -- signature = { enabled = true, window = { border = "single" } },
        },
    },
    {
        "echasnovski/mini.pairs",
        version = false,
        config = function()
            require("mini.pairs").setup({
                modes = { insert = true, command = true, terminal = false },
                -- skip autopair when next character is one of these
                skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
                -- skip autopair when the cursor is inside these treesitter nodes
                skip_ts = { "string" },
                -- skip autopair when next character is closing pair
                -- and there are more closing pairs than opening pairs
                skip_unbalanced = true,
                -- better deal with markdown code blocks
                markdown = true,
            })
        end,
    },
    -- "hrsh7th/nvim-cmp",
    -- event = { "InsertEnter", "CmdlineEnter" },
    -- dependencies = {
    -- 	{ "hrsh7th/cmp-nvim-lsp" },
    -- 	{ "hrsh7th/cmp-buffer" },
    -- 	{ "hrsh7th/cmp-path" },
    -- 	{ "hrsh7th/cmp-cmdline" },
    -- 	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
    -- 	{ "zbirenbaum/copilot-cmp" },
    -- 	{
    -- 		"L3MON4D3/LuaSnip",
    -- 		version = "2.*",
    -- 		build = "make install_jsregexp",
    -- 		dependencies = { "rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip" },
    -- 	},
    -- 	{
    -- 		"windwp/nvim-autopairs",
    -- 		event = "InsertEnter",
    -- 		opts = {},
    -- 	},
    -- },
    --    opts = function(_, opts)
    --        opts.sources = opts.sources or {}
    --        table.insert(opts.sources, {
    --            name = "lazydev",
    --            group_index = 0
    --        })
    --    end,
    -- config = function()
    --        require("custom.autocomplete")
    -- end,
}

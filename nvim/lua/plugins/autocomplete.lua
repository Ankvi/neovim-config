return {
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "kristijanhusak/vim-dadbod-ui",
        },

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
                    auto_brackets = { enabled = false },
                },
                keyword = {
                    range = "full",
                },
                -- ghost_text = {
                --     enabled = true,
                -- },
                -- menu = { border = "single" },
                menu = {
                    draw = {
                        columns = {
                            {
                                "label",
                                "label_description",
                                gap = 1,
                            },
                            {
                                "kind_icon",
                                "kind",
                                gap = 1,
                            },
                        },
                    },
                },
                -- documentation = { window = { border = "single" } },
            },

            signature = { enabled = true },
            -- signature = { enabled = true, window = { border = "single" } },

            sources = {
                providers = {
                    dadbod = {
                        name = "Dadbod",
                        module = "vim_dadbod_completion.blink",
                    },
                },
                default = { "lsp", "path", "snippets", "buffer", "dadbod" },
                per_filetype = {
                    sql = { "dadbod", "buffer" },
                },
            },
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    -- {
    --     "echasnovski/mini.pairs",
    --     version = false,
    --     config = function(plugin, opts)
    --         require("mini.pairs").setup({
    --             modes = { insert = true, command = false, terminal = false },
    --
    --             -- Global mappings. Each right hand side should be a pair information, a
    --             -- table with at least these fields (see more in |MiniPairs.map|):
    --             -- - <action> - one of "open", "close", "closeopen".
    --             -- - <pair> - two character string for pair to be used.
    --             -- By default pair is not inserted after `\`, quotes are not recognized by
    --             -- `<CR>`, `'` does not insert pair after a letter.
    --             -- Only parts of tables can be tweaked (others will use these defaults).
    --             -- Supply `false` instead of table to not map particular key.
    --             mappings = {
    --                 ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
    --                 ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
    --                 ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
    --
    --                 [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
    --                 ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
    --                 ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
    --
    --                 ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
    --                 ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
    --                 ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
    --             },
    --         })
    --     end,
    -- },
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

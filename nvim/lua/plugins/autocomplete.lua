return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "kristijanhusak/vim-dadbod-ui",
    },

    version = "v1.*",

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
        keyword = {
          range = "full",
        },
        documentation = {
          auto_show = false,
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
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
        default = { "lsp", "path", "snippets", "buffer", "dadbod", "lazydev" },
        per_filetype = {
          sql = { "dadbod", "buffer" },
        },
      },
    },
  },
  {
    "nvim-mini/mini.pairs",
    version = false,
    config = function()
      require("mini.pairs").setup()
    end,
  },
  -- {
  --   "windwp/nvim-autopairs",
  --   event = "InsertEnter",
  --   opts = {},
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

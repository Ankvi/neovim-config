return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "kristijanhusak/vim-dadbod-ui",
    },

    version = "v1.4.1",

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
        },
        default = { "lsp", "path", "snippets", "buffer", "dadbod" },
        per_filetype = {
          sql = { "dadbod", "buffer" },
        },
      },
    },
  },
  -- {
  --   "echasnovski/mini.pairs",
  --   event = "VeryLazy",
  --   opts = {
  --     modes = { insert = true, command = true, terminal = false },
  --     -- skip autopair when next character is one of these
  --     skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
  --     -- skip autopair when the cursor is inside these treesitter nodes
  --     skip_ts = { "string" },
  --     -- skip autopair when next character is closing pair
  --     -- and there are more closing pairs than opening pairs
  --     skip_unbalanced = true,
  --     -- better deal with markdown code blocks
  --     markdown = true,
  --   },
  --   config = function(_, opts)
  --     local pairs = require("mini.pairs")
  --     pairs.setup(opts)
  --     local open = pairs.open
  --     pairs.open = function(pair, neigh_pattern)
  --       if vim.fn.getcmdline() ~= "" then
  --         return open(pair, neigh_pattern)
  --       end
  --       local o, c = pair:sub(1, 1), pair:sub(2, 2)
  --       local line = vim.api.nvim_get_current_line()
  --       local cursor = vim.api.nvim_win_get_cursor(0)
  --       local next = line:sub(cursor[2] + 1, cursor[2] + 1)
  --       local before = line:sub(1, cursor[2])
  --       if opts.markdown and o == "`" and vim.bo.filetype == "markdown" and before:match("^%s*``") then
  --         return "`\n```" .. vim.api.nvim_replace_termcodes("<up>", true, true, true)
  --       end
  --       if opts.skip_next and next ~= "" and next:match(opts.skip_next) then
  --         return o
  --       end
  --       if opts.skip_ts and #opts.skip_ts > 0 then
  --         local ok, captures = pcall(vim.treesitter.get_captures_at_pos, 0, cursor[1] - 1, math.max(cursor[2] - 1, 0))
  --         for _, capture in ipairs(ok and captures or {}) do
  --           if vim.tbl_contains(opts.skip_ts, capture.capture) then
  --             return o
  --           end
  --         end
  --       end
  --       if opts.skip_unbalanced and next == c and c ~= o then
  --         local _, count_open = line:gsub(vim.pesc(pair:sub(1, 1)), "")
  --         local _, count_close = line:gsub(vim.pesc(pair:sub(2, 2)), "")
  --         if count_close > count_open then
  --           return o
  --         end
  --       end
  --       return open(pair, neigh_pattern)
  --     end
  --   end,
  -- },
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

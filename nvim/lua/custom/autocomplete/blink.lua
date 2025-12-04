local blink = require("blink.cmp")

blink.setup({
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
})

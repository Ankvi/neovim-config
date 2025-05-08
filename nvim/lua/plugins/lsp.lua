return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "lbrayner/vim-rzip" },
      {
        "Hoffs/omnisharp-extended-lsp.nvim",
      },
      {
        "Decodetalkers/csharpls-extended-lsp.nvim",
      },
      {
        "b0o/schemastore.nvim",
      },
      { "hrsh7th/cmp-nvim-lsp" },
      {
        "mason-org/mason.nvim",
        version = "^1.0.0",
        dependencies = {
          {
            "mason-org/mason-lspconfig.nvim",
            version = "^1.0.0",
          },
        },
      },
    },
    config = function()
      require("custom.lsp")
    end,
  },

  -- Rust things
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },

  -- .NET things
  {
    "seblj/roslyn.nvim",
    ft = "cs",
    opts = {
      -- your configuration comes here; leave empty for default settings
    },
  },

  -- TypeScript things
  -- {
  --     "pmizio/typescript-tools.nvim",
  --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --     config = function()
  --         require("typescript-tools").setup({
  --             single_file_support = false,
  --             root_dir = require("lspconfig.util").root_pattern("tsconfig.json"),
  --         })
  --     end,
  -- },

  -- Lua things
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "dapui" },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
}

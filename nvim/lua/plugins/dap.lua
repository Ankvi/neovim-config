return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "folke/lazydev.nvim",
    "mxsdev/nvim-dap-vscode-js",
    "nvim-neotest/nvim-nio",
    "leoluz/nvim-dap-go",
  },
  config = function()
    require("custom.dap")
  end,
  event = "VeryLazy",
}

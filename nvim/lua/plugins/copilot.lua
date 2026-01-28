return {
  -- "zbirenbaum/copilot-cmp",
  -- dependencies = {
  -- 	{
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-y>",
          next = "<C-n>",
          prev = "<C-p>",
        },
      },
      panel = { enabled = false },
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "BlinkCmpMenuOpen",
      callback = function()
        vim.b.copilot_suggestion_hidden = true
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "BlinkCmpMenuClose",
      callback = function()
        vim.b.copilot_suggestion_hidden = false
      end,
    })
  end,
  -- 	},
  -- },
  -- config = function()
  -- 	require("copilot_cmp").setup()
  -- end,
}

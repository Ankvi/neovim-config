local set = vim.keymap.set

-- Replace within selected section
set("v", "<leader>r", ":s/\\%V")

-- Move entire selection up or down
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Jump up and down in buffer and center screen on current line (zz)
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

set("n", "J", "mzJ`z")

-- Go to next/previous e.g. search result, then center screen (zz) and show cursor (zv)
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- Add a new line above or below current line and stay on current line
set("n", "<leader>o", "o<ESC>k")
set("n", "<leader>O", "O<ESC>j")

set("x", "<leader>p", '"_dP')

set("n", "<leader>y", '"+y')
set("v", "<leader>y", '"+y')
set("n", "<leader>Y", '"+Y')

set("n", "<leader>d", '"_d')
set("v", "<leader>d", '"_d')

set("n", "<leader>xo", vim.diagnostic.open_float, {
  desc = "Diagnostics: Open float",
})
set("n", "<C-k>", "<cmd>cnext<CR>zz")
set("n", "<C-j>", "<cmd>cprev<CR>zz")
set("n", "<leader>k", "<cmd>lnext<CR>zz")
set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- NAVIGATING BUFFERS
set("n", "<A-,>", vim.cmd.bprevious)
set("n", "<A-.>", vim.cmd.bnext)
set("n", "<A-c>", vim.cmd.bd)
-- set('n', '<space>e', vim.diagnostic.open_float)
-- set('n', '[d', vim.diagnostic.goto_prev)
-- set('n', ']d', vim.diagnostic.goto_next)
-- set('n', '<space>q', vim.diagnostic.setloclist)

-- RESIZING SPLITS
set("n", "<A-a>", "<C-w>5<")
set("n", "<A-d>", "<C-w>5>")
set("n", "<A-s>", "<C-w>+")
set("n", "<A-w>", "<C-w>-")

-- Inlay hints
set("n", "<leader>h", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  vim.notify("Inlay hints " .. (vim.lsp.inlay_hint.is_enabled() and "enabled" or "disabled"))
end)

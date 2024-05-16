local set = vim.keymap.set

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("x", "<leader>p", '"_dP')

set("n", "<leader>y", '"+y')
set("v", "<leader>y", '"+y')
set("n", "<leader>Y", '"+Y')

set("n", "<leader>d", '"_d')
set("v", "<leader>d", '"_d')

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



local no_preview = require("custom.telescope.no-preview")
local builtin = require("telescope.builtin")

local M = {}

M.setup = function()
    vim.keymap.set("n", "<leader>lm", function()
        local opts = vim.tbl_extend(
            "keep",
            no_preview(),
            { git_command = { "git", "ls-files", "--modified", "--exclude-standard", "--others" } }
        )
        builtin.git_files(opts)
    end, { desc = "List all modified files in the working directory" })
end

return M

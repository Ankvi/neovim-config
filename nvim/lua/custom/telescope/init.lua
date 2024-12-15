local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
local builtin = require("telescope.builtin")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

local function opts(description)
    return {
        noremap = true,
        desc = description,
    }
end

local no_preview = require("custom.telescope.no-preview")

vim.keymap.set("n", "<leader>pf", builtin.find_files, opts("List all files in working directory"))
vim.keymap.set("n", "<C-p>", builtin.git_files, opts("List all files tracked by git in the working directory"))
vim.keymap.set("n", "<leader><Tab>", function()
    builtin.buffers(no_preview())
end, opts("List all currently open buffers"))
vim.keymap.set("n", "<leader>vh", builtin.help_tags, opts("Help tags"))
vim.keymap.set(
    "n",
    "<leader>pv",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    opts("Open file browser in the current buffer's directory")
)
vim.keymap.set("n", "<leader>pV", ":Telescope file_browser<CR>", opts("Open file browser"))
vim.keymap.set("n", "<leader>pn", function()
    builtin.find_files({
        cwd = vim.fn.stdpath("data") .. "/lazy",
    })
end, {
    desc = "List files of lazy packages",
})

require("custom.telescope.multigrep").setup()
require("custom.telescope.list-modified-files").setup()

telescope.setup({
    defaults = {
        vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        buffers = {
            sort_mru = true,
            sort_lastused = true,
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor(),
        },
        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            hidden = {
                file_browser = true,
                folder_browser = true,
            },
        },
        fzf = {},
    },
})
telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
telescope.load_extension("fzf")

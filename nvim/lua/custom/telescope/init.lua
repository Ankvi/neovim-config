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

local opts = {
	noremap = true,
}

vim.keymap.set("n", "<leader>pf", builtin.find_files, opts)
vim.keymap.set("n", "<C-p>", builtin.git_files, opts)
vim.keymap.set("n", "<leader><Tab>", builtin.buffers, opts)
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, opts)
vim.keymap.set("n", "<leader>vh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>pv", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", opts)
vim.keymap.set("n", "<leader>pV", ":Telescope file_browser<CR>", opts)

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
            sort_lastused = true
        }
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
	},
})
telescope.load_extension("ui-select")
telescope.load_extension("file_browser")

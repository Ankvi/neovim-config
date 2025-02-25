return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("custom.telescope")
    end,
}

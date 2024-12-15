local cmp = require("cmp")
local borders = require("custom.ascii-borders")

---@type cmp.WindowConfig
local default = {
    completion = cmp.config.window.bordered(),
}

---@type cmp.WindowConfig
local cmdline = {
    completion = cmp.config.window.bordered({
        border = {
            borders.upper_right,
            " ",
            borders.upper_left,
            borders.vertical,
            borders.lower_right,
            borders.horizontal,
            borders.lower_left,
            borders.vertical,
        },
    }),
}

return {
    default = default,
    cmdline = cmdline,
}

local M = {}

M.setup = function()
    require("ankvi.plugins.dap.languages.csharp").setup()
    require("ankvi.plugins.dap.languages.typescript").setup()
end

return M

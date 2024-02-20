--- @class Dotnet
--- @function Restore(opts: RestoreOpts)
local M = {}

function M.restore(opts)
    print("Got restore opts: " .. vim.fn.json_encode(opts))
    local result = vim.fn.system("dotnet restore")
    vim.notify(result)
end

return M

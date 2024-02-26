--- @class RestoreOpts
--- @field noCache boolean Don't use cache

--- @class Dotnet
local M = {}

--- Runs dotnet restore
--- @param opts RestoreOpts
function M.restore(opts)
    print("Got restore opts: " .. vim.fn.json_encode(opts))
    local result = vim.fn.system("dotnet restore")
    vim.notify(result)
end

function M.build(opts)
    vim.fn.system("dotnet build")
end

return M


local M = {}

M.setup = function()
    local vscodeLaunchConfigs = require("ankvi.plugins.dap.languages.vscode-launch-configs")
    vscodeLaunchConfigs.get_launch_configs()
    vscodeLaunchConfigs.get_tasks()

    require("ankvi.plugins.dap.languages.csharp").setup()
    require("ankvi.plugins.dap.languages.typescript").setup()
end

return M

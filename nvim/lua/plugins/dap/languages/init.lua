local M = {}

M.setup = function()
    local vscodeLaunchConfigs = require("plugins.dap.languages.vscode-launch-configs")
    vscodeLaunchConfigs.get_launch_configs()
    vscodeLaunchConfigs.get_tasks()

    require("plugins.dap.languages.csharp").setup()
    require("plugins.dap.languages.typescript").setup()
end

return M

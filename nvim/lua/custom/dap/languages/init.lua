local vscodeLaunchConfigs = require("custom.dap.languages.vscode-launch-configs")
vscodeLaunchConfigs.get_launch_configs()
vscodeLaunchConfigs.get_tasks()

require("custom.dap.languages.csharp")
require("custom.dap.languages.typescript")
require("custom.dap.languages.go")

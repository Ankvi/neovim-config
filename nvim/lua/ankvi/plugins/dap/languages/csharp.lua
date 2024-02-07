local M = {}

M.configure_configurations = function()
	local dap = require("dap")
	dap.adapters.coreclr = {
		type = "executable",
		command = "netcoredbg",
		args = { "--interpreter=vscode" },
	}

    dap.configurations.cs = {}
	local projectConfigurations = require("ankvi.plugins.dap.languages.vscode-launch-configs").get_launch_configs()
	for _, config in ipairs(projectConfigurations) do
		table.insert(dap.configurations.cs, config)
	end
end

M.setup = function()
	M.configure_configurations()
end

return M

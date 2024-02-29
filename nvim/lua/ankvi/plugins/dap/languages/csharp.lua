local M = {}

M.configure_configurations = function()
	local dap = require("dap")
	local vscodeLaunchConfigs = require("ankvi.plugins.dap.languages.vscode-launch-configs")

	dap.adapters.coreclr = {
		type = "executable",
		command = "netcoredbg",
		args = { "--interpreter=vscode" },
	}

	dap.configurations.cs = {}
	local projectConfigurations = vscodeLaunchConfigs.get_launch_configs()
	for _, config in ipairs(projectConfigurations) do
		if config.preLaunchTask then
			local task = vscodeLaunchConfigs.get_task_for_label(config.preLaunchTask)
			if task ~= nil then
				local command = task.command .. " " .. table.concat(task.args, " ")
				config.preLaunchTask = command
			end
		end
		table.insert(dap.configurations.cs, config)
	end
end

M.setup = function()
	M.configure_configurations()
end

return M

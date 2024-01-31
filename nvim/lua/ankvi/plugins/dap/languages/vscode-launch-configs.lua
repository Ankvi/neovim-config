local M = {}

M.get_launch_configs = function()
	local vscodeLaunchConfigPath = vim.fn.getcwd() .. "/.vscode/launch.json"
	local vscodeLaunchConfig = vim.fn.json_decode(vim.fn.readfile(vscodeLaunchConfigPath))

	if vscodeLaunchConfig == nil then
		return {}
	end

	local configurations = {}

	if vscodeLaunchConfig.configurations ~= nil then
		for _, config in ipairs(vscodeLaunchConfig.configurations) do
			table.insert(configurations, config)
		end
	end

	return configurations
end

return M

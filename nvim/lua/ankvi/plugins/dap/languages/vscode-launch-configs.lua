local M = {}

local configurations = {}
M.has_loaded_configs = false

M.get_launch_configs = function()
    if M.has_loaded_configs then
        return configurations
    end

	local vscodeLaunchConfigPath = vim.fn.getcwd() .. "/.vscode/launch.json"
    local status, launchFile = pcall(vim.fn.readfile, vscodeLaunchConfigPath)

    if not status then
        return {}
    end

	local vscodeLaunchConfig = vim.fn.json_decode(launchFile)

	if vscodeLaunchConfig == nil then
		return {}
	end

	if vscodeLaunchConfig.configurations ~= nil then
		for _, config in ipairs(vscodeLaunchConfig.configurations) do
			table.insert(configurations, config)
		end
	end

	return configurations
end

return M

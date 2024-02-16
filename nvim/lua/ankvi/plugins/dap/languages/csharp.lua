local M = {}

M.configure_configurations = function()
	local dap = require("dap")
    local vscodeLaunchConfigs = require("ankvi.plugins.dap.languages.vscode-launch-configs")

	dap.adapters.coreclr = function(callback, config)
        -- if config.preLaunchTask then
        --     vim.notify("Running " .. config.name .. " task " .. config.preLaunchTask)
        --     local task = vscodeLaunchConfigs.get_task_for_label(config.preLaunchTask)
        --     if task ~= nil then
        --         local command = task.command .. " " .. table.concat(task.args, " ")
        --         command = string.gsub(command, "${workspaceFolder}", vim.fn.getcwd())
        --
        --         local exitCode = os.execute(command .. " > /dev/null")
        --         if exitCode ~= 0 then
        --             vim.notify("Something went wrong!")
        --         end
        --         vim.notify("Finished! Launching configuration: " .. config.name)
        --     else
        --         vim.notify("Task with label " .. config.preLaunchTask .. " does not exist in tasks.json")
        --     end
        -- end
        local adapter = {
            type = "executable",
            command = "netcoredbg",
            args = { "--interpreter=vscode" },
        }
        callback(adapter)
    end

    dap.configurations.cs = {}
	local projectConfigurations = vscodeLaunchConfigs.get_launch_configs()
	for _, config in ipairs(projectConfigurations) do
        if config.preLaunchTask then
            local task = vscodeLaunchConfigs.get_task_for_label(config.preLaunchTask)
            if task ~= nil then
                local command = task.command .. " " .. table.concat(task.args, " ")
                -- command = string.gsub(command, "${workspaceFolder}", vim.fn.getcwd())
                config.preLaunchTask = command

                -- local exitCode = os.execute(command .. " > /dev/null")
                -- if exitCode ~= 0 then
                --     vim.notify("Something went wrong!")
                -- end
            --     vim.notify("Finished! Launching configuration: " .. config.name)
            -- else
            --     vim.notify("Task with label " .. config.preLaunchTask .. " does not exist in tasks.json")
            end

        end
		table.insert(dap.configurations.cs, config)
	end
end

M.setup = function()
	M.configure_configurations()
end

return M

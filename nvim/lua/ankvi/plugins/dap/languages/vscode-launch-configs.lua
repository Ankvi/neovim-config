---@class Task
---@field label string
---@field command string
---@field args string[]

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

    for i, line in ipairs(launchFile) do
        -- Look for lines that only include comments
        local commentIndex = string.find(line, "^%s+%/%/")
        if commentIndex ~= nil then
            launchFile[i] = ""
        end
    end

	local status, vscodeLaunchConfig = pcall(vim.fn.json_decode, launchFile)

    if not status then
        return {}
    end

	if vscodeLaunchConfig == nil then
		return {}
	end

	if vscodeLaunchConfig.configurations ~= nil then
		for _, config in ipairs(vscodeLaunchConfig.configurations) do
			table.insert(configurations, config)
		end
	end

    M.has_loaded_configs = true

	return configurations
end

---@type Task[] tasks
local tasks = {}
M.has_loaded_tasks = false


---@type fun(): Task[] tasks
function M.get_tasks()
    if M.has_loaded_tasks then
        return tasks
    end

	local vscodeTasksPath = vim.fn.getcwd() .. "/.vscode/tasks.json"
    local status, tasksFile = pcall(vim.fn.readfile, vscodeTasksPath)

    if not status then
        return {}
    end

    for i, line in ipairs(tasksFile) do
        -- Look for lines that only include comments
        local commentIndex = string.find(line, "^%s+%/%/")
        if commentIndex ~= nil then
            tasksFile[i] = ""
        end
    end

	local status, vscodeTasks = pcall(vim.fn.json_decode, tasksFile)

    if not status then
        return {}
    end

	if vscodeTasks == nil then
		return {}
	end


	if vscodeTasks.tasks ~= nil then
		for _, task in ipairs(vscodeTasks.tasks) do
			table.insert(tasks, task)
		end
	end

    M.has_loaded_tasks = true

	return tasks
end

--- Get task with the given label
--- @param label string
---@return Task | nil
function M.get_task_for_label(label)
    for _, task in ipairs(M.get_tasks()) do
        if task.label == label then
            vim.notify("Found task!")
            return task
        end
    end

    return nil
end

return M

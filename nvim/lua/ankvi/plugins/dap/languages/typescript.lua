local M = {}

M.setup = function()
	require("dap-vscode-js").setup({
        debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
        debugger_cmd = { "js-debug-adapter" },
		adapters = {
			"pwa-node",
			"pwa-chrome",
			"node-terminal",
		},
	})

	local dap = require("dap")
	local dap_utils = require("dap.utils")

	local configurations = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = dap_utils.pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}

    local projectConfigurations = require("ankvi.plugins.dap.languages.vscode-launch-configs").get_launch_configs()
	for _, config in ipairs(projectConfigurations) do
		table.insert(configurations, config)
	end

	for _, language in ipairs({ "typescript", "javascript" }) do
		dap.configurations[language] = configurations
	end
end

return M

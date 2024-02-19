vim.api.nvim_create_user_command("Dotnet", function (opts)
    local command = opts.fargs[1]
    vim.notify("Running 'dotnet " .. command .. "'")
    local result = vim.fn.system("dotnet " .. command)
    if string.find(command, "^restore") ~= nil then
        vim.notify(result)
    end
end, {
    nargs = 1,
    complete = function(ArgLead, CmdLine, CursorPos)
        return { "build", "restore" }
    end
})

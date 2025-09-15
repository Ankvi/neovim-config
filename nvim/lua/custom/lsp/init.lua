local servers = require("custom.lsp.servers")

for name, opts in pairs(servers.server_configs) do
  vim.lsp.enable(name)
  vim.lsp.config(name, opts)
end

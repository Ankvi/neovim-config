local schemastore = require("schemastore")

local configs = {
  -- arduino_language_server = {
  --     cmd = {
  --         "arduino-language-server",
  --         "-cli-config",
  --         "$HOME/.arduino15/arduino-cli.yaml",
  --         "-fqbn",
  --         "arduino:avr:micro",
  --     },
  -- },
  -- bashls = {},
  biome = {
    -- root_dir = lspconfig_util.root_pattern("biome.json", "biome.jsonc"),
    -- single_file_support = false,
  },
  denols = {
    root_markers = { "deno.json", "deno.jsonc" },
    workspace_required = true,
  },
  -- clangd = {},
  -- csharp_ls = {
  --     handlers = {
  --         ["textDocument/definition"] = require("csharpls_extended").handler,
  --         ["textDocument/typeDefinition"] = require("csharpls_extended").handler,
  --     },
  -- },
  gopls = {},
  cssls = {
    settings = {
      css = {
        lint = {
          unknownAtRules = "ignore",
        },
      },
    },
  },
  dockerls = {},
  eslint = {},
  html = {},
  jsonls = {
    settings = {
      json = {
        schemas = schemastore.json.schemas(),
        validate = {
          enable = true,
        },
      },
    },
  },
  lemminx = {},
  lua_ls = {},
  -- powershell_es = {
  --   bundle_path = require("mason-core.path").package_prefix("powershell-editor-services"),
  -- },
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "openFilesOnly",
          extraPaths = {
            "/home/andreas/.vscode/extensions/joedevivo.vscode-circuitpython-0.1.20-linux-x64/boards/0x239A/0x80F4",
            "/home/andreas/.vscode/extensions/joedevivo.vscode-circuitpython-0.1.20-linux-x64/stubs",
            "/home/andreas/.config/Code/User/globalStorage/joedevivo.vscode-circuitpython/bundle/20230926/adafruit-circuitpython-bundle-py-20230926/lib",
          },
        },
      },
    },
  },
  roslyn_ls = {
    cmd = {
      "dotnet",
      vim.fn.stdpath("data") .. "/roslyn/Microsoft.CodeAnalysis.LanguageServer.dll",
      "--logLevel",
      "Information",
      "--extensionLogDirectory",
      "/tmp/roslyn_ls/logs",
      "--stdio",
    },
    -- root_markers = { "*.sln" },
  },
  tailwindcss = {},
  vimls = {},
  vtsls = {
    root_markers = {
      ".git",
      "package-lock.json",
      "yarn.lock",
      "pnpm-lock.yaml",
      "bun.lockb",
      "bun.lock",
    },
    single_file_support = false,
  },
  yamlls = {
    settings = {
      yaml = {
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = schemastore.yaml.schemas(),
      },
    },
  },
}

return {
  server_configs = configs,
  exclude_install = {},
}

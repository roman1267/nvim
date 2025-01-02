--- NOTE: Set up LSP clients

-- List of servers to be set up and options
local servers = {
  rust_analyzer = {},
  bashls = {},
  html = {},
  ruff = {},
  pylsp = {
    pylsp = {
      plugins = {
        pydocstyle = {
          enabled = true,
        },
        pyflakes = {
          enabled = false,
        },
        pylint = {
          enabled = false,
        },
        yapf = {
          enabled = false,
        },
        autopep8 = {
          enabled = false,
        },
        flake8 = {
          enabled = false,
        },
        mccabe = {
          enabled = false,
        },
        pycodestyle = {
          enabled = false,
        },
      },
    },
  },
  lua_ls = {
    lua = {
      workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
      diagnostics = {
        globals = { "vim", "require" },
      },
    },
  },
  ltex = {
    ltex = {
      enabled = { "latex", "tex", "bib", "markdown", "md" },
      language = "en-US",
      diagnosticSeverity = "hint", -- error, warning, information, hint
      sentenceCacheSize = 2000,
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "en-US",
      },
      trace = { server = "verbose" },
      -- dictionary = {
      -- 	["en-US"] = words,
      -- },
      hiddenFalsePositives = {},
    },
  },
}
return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    priority = 100,
    opts = {},
  },
  {
    "williamboman/mason-lspconfig",
    dependencies = { "williamboman/mason.nvim" },
    lazy = false,
    priority = 99,
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "williamboman/mason.nvim",
    },
    lazy = false,
    priority = 98,
    config = function()
      -- Establish LSP server capabilities
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
      })
      require("mason-lspconfig").setup_handlers({
        ["lua_ls"] = function()
          require("lspconfig")["lua_ls"].setup({
            capabilities = capabilities,
            settings = servers["lua_ls"],
          })
        end,
        function(server_name) -- default handler
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            settings = servers[server_name],
          })
        end,
      })
    end,
  },
}

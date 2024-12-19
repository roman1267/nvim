-- Establish LSP server capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers),
    })
    require("mason-lspconfig").setup_handlers({
      ["lua_ls"] = function()
        require("lazy").load({ plugins = "lazydev.nvim" })
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
}

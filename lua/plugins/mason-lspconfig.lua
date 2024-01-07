return {
   "neovim/nvim-lspconfig",
   dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/nvim-cmp",
      "williamboman/mason-lspconfig.nvim",
      "L3MON4D3/LuaSnip",
   },
   lazy = true,
   event = { "BufReadPost", "BufNewFile" },
   config = function()
      -- additional server capabilities from nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local servers = {
         rust_analyzer = {},
         bashls = {},
         html = {},
         pylsp = {},
         lua_ls = {},
      }

      require("mason-lspconfig").setup({
         ensure_installed = vim.tbl_keys(servers),
      })
      require("mason-lspconfig").setup_handlers({
         -- Custom handlers for specific servers
         ["rust_analyzer"] = function()
            require("rust-tools").setup({
               inlay_hints = {
                  -- automatically set inlay hints (type hints)
                  -- default: true
                  auto = true,
                  -- Only show inlay hints for the current line
                  only_current_line = false,
                  -- whether to show parameter hints with the inlay hints or not
                  -- default: true
                  show_parameter_hints = true,
                  -- prefix for parameter hints
                  -- default: "<-"
                  parameter_hints_prefix = "<- ",
                  -- prefix for all the other hints (type, chaining)
                  -- default: "=>"
                  other_hints_prefix = "=> ",
                  -- whether to align to the length of the longest line in the file
                  max_len_align = false,
                  -- padding from the left if max_len_align is true
                  max_len_align_padding = 1,
                  -- whether to align to the extreme right or not
                  right_align = false,
                  -- padding from the right if right_align is true
                  right_align_padding = 7,
                  -- The color of the hints
                  highlight = "Comment",
               },
            })
         end,
         ["lua_ls"] = function()
            require("lazy").load({ plugins = "neodev.nvim" })
            require("lspconfig").lua_ls.setup({
               settings = {
                  Lua = {
                     workspace = { checkThirdParty = false },
                     telemetry = { enable = false },
                     diagnostics = {
                        globals = { "vim" },
                     },
                  },
               },
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

return {
   "hrsh7th/nvim-cmp",
   dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
   },
   lazy = true,
   opts = {
      snippet = {
         -- REQUIRED - you must specify a snippet engine
         expand = function(args)
            require("luasnip").lsp_expand(args.body)
         end,
      },
      window = {
         completion = require("cmp").config.window.bordered(),
         documentation = require("cmp").config.window.bordered(),
      },
      mapping = require("cmp").mapping.preset.insert({
         ["<C-d>"] = require("cmp").mapping.scroll_docs(-4),
         ["<C-u>"] = require("cmp").mapping.scroll_docs(4),
         ["<C-Space>"] = require("cmp").mapping.complete(),
         ["<C-e>"] = require("cmp").mapping.abort(),
         ["<CR>"] = require("cmp").mapping.confirm({
            behavior = require("cmp").ConfirmBehavior.Replace,
            select = true,
         }),
         ["<Tab>"] = require("cmp").mapping(function(fallback)
            if require("cmp").visible() then
               require("cmp").select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
               require("luasnip").expand_or_jump()
            else
               fallback()
            end
         end, { "i", "s" }),
         ["<S-Tab>"] = require("cmp").mapping(function(fallback)
            if require("cmp").visible() then
               require("cmp").select_prev_item()
            elseif require("luasnip").jumpable(-1) then
               require("luasnip").jump(-1)
            else
               fallback()
            end
         end, { "i", "s" }),
      }),
      sources = require("cmp").config.sources({
         { name = "nvim_lsp" },
         { name = "lua_ls" },
         { name = "luasnip" },
         { name = "path" },
         { name = "buffer" },
      }),
   },
   config = function(_, opts)
      require("cmp").setup(opts)
   end,
}

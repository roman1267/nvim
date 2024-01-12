local cfgs = "plugins.configs."
return {
   {
      "nvim-tree/nvim-web-devicons",
      enabled = true,
      lazy = true,
   },
   {
      "nvim-treesitter/nvim-treesitter",
      dependencies = { "nvim-treesitter/nvim-treesitter-context", "nvim-treesitter/nvim-treesitter-textobjects" },
      lazy = true,
      event = { "UIEnter" },
      build = function()
         pcall(require("nvim-treesitter.install").update({ with_sync = true }))
      end,
      init = function(plugin)
         require("lazy.core.loader").add_to_rtp(plugin)
         require("nvim-treesitter.query_predicates")
         require("core/utils").load_mappings("treesitter")
      end,
      config = require(cfgs .. "treesitter"),
   },
   {
      -- Additional text objects via treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",
      lazy = true,
   },
   {
      "elkowar/yuck.vim",
      lazy = true,
      ft = { "yuck" },
   },
   {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      build = "make install_jsregexp",
      lazy = true,
      config = function()
         require("luasnip.loaders.from_vscode").lazy_load()
      end,
   },
   -- highlighting of code comments like 'HACK,' 'BUG,' etc.
   {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      lazy = true,
      event = { "VeryLazy" },
      init = function()
         require("core/utils").load_mappings("todo_comments")
      end,
      opts = function()
         require("todo-comments").setup()
      end,
   },
   {
      "HiPhish/debugpy.nvim",
      lazy = true,
      ft = "py",
   },
   {
      "mfussenegger/nvim-dap-python",
      lazy = true,
      ft = "py",
   },
   {
      "luckasRanarison/tree-sitter-hyprlang",
      -- TODO: requires experimentation
      lazy = true,
      event = { "BufReadPost", "BufNewFile" },
   },
   {
      "simrat39/rust-tools.nvim",
      lazy = true,
   },
   {
      "epwalsh/obsidian.nvim",
      version = "*", -- recommended, use latest release instead of latest commit
      lazy = true,
      event = {
         "BufReadPre " .. vim.fn.expand("~") .. "/OneDrive/Documents/roman-obsidian/**.md",
         "BufNewFile " .. vim.fn.expand("~") .. "/OneDrive/Documents/roman-obsidian/**.md",
      },
      dependencies = {
         -- Required.
         "nvim-lua/plenary.nvim",

         -- see below for full list of optional dependencies 👇
      },
      opts = {
         -- workspaces = {
         --    {
         --       name = "personal",
         --       path = "~/OneDrive/personal",
         --    },
         --    {
         --       name = "work",
         --       path = "~/vaults/work",
         --    },
         -- },
      },
   },
   {
      "stevearc/conform.nvim",
      lazy = true,
      event = "VeryLazy",
      config = require(cfgs .. "conform"),
   },
   {
      "ellisonleao/gruvbox.nvim",
      enabled = true,
      lazy = true,
      -- event = 'VimEnter',
      config = require(cfgs .. "gruvbox"),
   },
   {
      "catppuccin/nvim",
      enabled = true,
      lazy = true,
      event = "VimEnter",
      config = function()
         vim.cmd.colorscheme("catppuccin-macchiato")
      end,
   },
   {
      "mfussenegger/nvim-dap",
      lazy = true,
      event = "VeryLazy",
      init = function()
         require("core.utils").load_mappings("nvim_dap")
      end,
      config = require(cfgs .. "nvim-dap"),
   },
   {
      "mfussenegger/nvim-lint",
      lazy = true,
   },
   {
      "rshkarin/mason-nvim-lint",
      dependencies = "mfussenegger/nvim-lint",
      lazy = true,
      event = "LspAttach",
      config = require(cfgs .. "nvim-lint"),
   },
   {
      "rcarriga/nvim-dap-ui",
      lazy = true,
      event = "VeryLazy",
      dependencies = { "mfussenegger/nvim-dap" },
      opts = function()
         require("dapui").setup()
      end,
   },
   {
      "nvim-tree/nvim-tree.lua",
      lazy = true,
      cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" },
      init = function()
         require("core/utils").load_mappings("nvim_tree")
      end,
      config = require(cfgs .. "nvim-tree"),
   },
   {
      "NvChad/nvterm",
      lazy = true,
      init = function()
         require("core/utils").load_mappings("nvterm")
      end,
      config = require(cfgs .. "nvterm"),
   },
   {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
      init = function()
         require("core/utils").load_mappings("telescope")
      end,
      lazy = true,
      cmd = { "Telescope", "TodoTelescope" },
      config = require(cfgs .. "telescope"),
   },
   {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      lazy = true,
      cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
      config = function()
         require("mason").setup()
      end,
   },
   {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
         "williamboman/mason.nvim",
         "hrsh7th/nvim-cmp",
      },
      lazy = true,
      config = require(cfgs .. "mason-lspconfig"),
   },
   {
      "RRethy/vim-illuminate", -- automatic reference highlighting
      enabled = false,
      lazy = true,
   },
   -- TODO: Set this up to work properly
   {
      "folke/neodev.nvim",
      lazy = true,
      config = require(cfgs .. "neodev"),
   },
   {
      "nvim-lualine/lualine.nvim",
      lazy = true,
      event = "VeryLazy",
      config = require(cfgs .. "lualine"),
   },
   {
      -- LSP Configuration & Plugins
      "neovim/nvim-lspconfig",
      lazy = true,
      event = { "BufReadPost", "BufNewFile" },
      dependencies = {
         "williamboman/mason.nvim",
         "williamboman/mason-lspconfig.nvim",
         "WhoIsSethDaniel/lualine-lsp-progress.nvim",
         "L3MON4D3/LuaSnip",
         --'folke/neodev.nvim',
      },
      config = function()
         require(cfgs .. "mason-lspconfig")
      end,
   },
   {
      "tpope/vim-fugitive",
      enabled = false,
      lazy = true,
   },
   {
      "kdheepak/lazygit.nvim",
      lazy = true,
      event = "VeryLazy",
      init = function()
         require("core/utils").load_mappings("lazygit")
      end,
   },
   {
      "lewis6991/gitsigns.nvim",
      lazy = true,
      ft = "gitcommit",
      opts = require(cfgs .. "gitsigns"),
   },
   -- Add indentation guides even on blank lines
   {
      "lukas-reineke/indent-blankline.nvim",
      lazy = true,
      event = "VeryLazy",
      main = "ibl",
      opts = function()
         require("ibl").setup({
            indent = {
               char = "┊",
            },
         })
      end,
   },
   {
      "windwp/nvim-autopairs",
      enabled = false,
      lazy = true,
      event = "InsertEnter",
      config = require(cfgs .. "autopairs"),
   },
   {
      "akinsho/bufferline.nvim",
      lazy = true,
      event = { "VeryLazy" },
      config = require(cfgs .. "bufferline"),
   },
   {
      "nvim-treesitter/nvim-treesitter-context",
      lazy = true,
      config = function(_, opts)
         require("treesitter-context").setup(opts)
      end,
   },
   {
      "numToStr/Comment.nvim",
      lazy = true,
      event = { "VeryLazy" },
      config = function()
         require("Comment").setup()
      end,
   },
   {
      "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
      lazy = true,
      event = { "BufReadPre", "BufNewFile" },
   },
   {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = vim.fn.executable("make") == 1,
      lazy = true,
   },
   {
      "folke/which-key.nvim",
      lazy = true,
      keys = { '"', "`", "d", "y", "g", "v", "z", "c", "<leader>" },
      config = require(cfgs .. "which-key"),
   },
}

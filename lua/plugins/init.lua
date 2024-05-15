return {
   {
      "nvim-tree/nvim-web-devicons",
      enabled = true,
      lazy = false,
   },
   {
      -- Additional text objects via treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",
      lazy = false,
   },
   {
      "elkowar/yuck.vim",
      lazy = false,
      ft = { "yuck" },
   },
   {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      build = "make install_jsregexp",
      lazy = false,
      config = function()
         require("luasnip.loaders.from_vscode").lazy_load()
      end,
   },
   -- highlighting of code comments like 'HACK,' 'BUG,' etc.
   {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      lazy = false,
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
      lazy = false,
      ft = "py",
   },
   {
      "mfussenegger/nvim-dap-python",
      lazy = false,
      ft = "py",
   },
   {
      "luckasRanarison/tree-sitter-hypr",
      -- TODO: requires experimentation
      lazy = false,
      event = { "BufReadPost", "BufNewFile" },
   },
   {
      "simrat39/rust-tools.nvim",
      lazy = false,
   },
   {
      "andymass/vim-matchup",
      lazy = false,
   },
   {
      "rcarriga/nvim-dap-ui",
      dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
      lazy = false,
      event = "LspAttach",
      config = function()
         require("dapui").setup()
      end,
   },
   {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      lazy = false,
      cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
      config = function()
         require("mason").setup()
      end,
   },
   {
      "RRethy/vim-illuminate", -- automatic reference highlighting
      enabled = false,
      lazy = false,
   },
   {
      "tpope/vim-fugitive",
      enabled = false,
      lazy = false,
   },
   {
      "kdheepak/lazygit.nvim",
      lazy = false,
      event = "VeryLazy",
      init = function()
         require("core/utils").load_mappings("lazygit")
      end,
   },
   -- Add indentation guides even on blank lines
   {
      "lukas-reineke/indent-blankline.nvim",
      lazy = false,
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
      "numToStr/Comment.nvim",
      lazy = false,
      event = { "VeryLazy" },
      config = function()
         require("Comment").setup()
      end,
   },
   {
      "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
      lazy = false,
      event = { "BufReadPre", "BufNewFile" },
   },
   {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = vim.fn.executable("make") == 1,
      lazy = false,
   },
}

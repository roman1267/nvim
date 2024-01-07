return {
   {
      "nvim-tree/nvim-web-devicons",
      enabled = true,
      lazy = true,
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
      "luckasRanarison/tree-sitter-hypr",
      -- TODO: requires experimentation
      lazy = true,
      event = { "BufReadPost", "BufNewFile" },
   },
   {
      "simrat39/rust-tools.nvim",
      lazy = true,
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
      "rcarriga/nvim-dap-ui",
      dependencies = "mfussenegger/nvim-dap",
      lazy = true,
      event = "LspAttach",
      opts = function()
         require("dapui").setup()
      end,
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
      "RRethy/vim-illuminate", -- automatic reference highlighting
      enabled = false,
      lazy = true,
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
}

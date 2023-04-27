Options = {}
Options.bufferline = require('lua/plugins/configs/bufferline')
Options.nvimtree = require('lua/plugins/configs/nvimtree')
Options.treesitter = require('lua/plugins/configs/treesitter')
--Options.cmp = require('lua/plugins/configs/cmp')
Options.which_key = require('lua/plugins/configs/which_key')
Options.telescope = require('lua/plugins/configs/telescope')
Options.nvterm = require('lua/plugins/configs/nvterm')
Options.lualine = require('lua/plugins/configs/lualine')
Options.others = require('lua/plugins/configs/others')

return{
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    config = function()
      require('nvim-treesitter').setup(Options.treesitter)
    end,
  },

  { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter',
  },

  -- highlighting of code comments like 'HACK,' 'BUG,' etc.
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end
  },

  --TODO: Configuration
  'simrat39/rust-tools.nvim',
  --TODO: Configuration
  'puremourning/vimspector',
  --TODO: Configuration
  'mfussenegger/nvim-dap',

  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require('dapui').setup()
    end },

  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require('gruvbox').setup(Options.others.gruvbox)
    end
  },

  --TODO: Configuration
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup(Options.others.autopairs)
    end
  },

  {
    "NvChad/nvterm",
    config = function()
      require('nvterm').setup(Options.nvterm)
    end,
  },

  --'lewis6991/impatient.nvim', -- faster nvim loading

  --TODO: Configuration
  {
    'williamboman/mason.nvim',
    build = ":MasonUpdate",
  },

  --TODO: Configuration
  {
    'williamboman/mason-lspconfig.nvim',
  },

  --TODO: Configuration
  'RRethy/vim-illuminate', -- automatic reference highlighting

  --TODO: Configuration
  {
    'folke/neodev.nvim',
    config = function()
      require('neodev').setup({
        library = { plugins = { 'nvim-dap-ui' }, types = true },
      })
    end
  },

  --TODO: Configuration
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      'WhoIsSethDaniel/lualine-lsp-progress.nvim',
      'folke/neodev.nvim',
    },
  },

  --TODO: Configuration
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'nvim-lspconfig',
      'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'hrsh7th/nvim-cmp' },
    config = function()
      require('cmp').setup(Options.cmp)
    end
  },

  { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },

  --TODO: Configuration
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup(Options.nvimtree)
    end,
  },


  --TODO: Configuration
  {
    "folke/which-key.nvim",
    config = function()
      require('which-key').setup(Options.which_key)
    end
  },

  --TODO: Configuration
  --{
  --  'akinsho/bufferline.nvim',
  --  dependencies = 'nvim-tree/nvim-web-devicons',
  --  config = function()
  --    require('bufferline').setup(Options.bufferline)
  --  end
  --},

  -- Git related plugins
  --TODO: Configuration
  'tpope/vim-fugitive',

  --TODO: Configuration
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup(Options.others.gitsigns)
    end
  },

  -- Add indentation guides even on blank lines
  --TODO: Configuration
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup(Options.others.blankline)
    end
  },

  -- Fancier statusline
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup(Options.lualine)
    end
  },

  'kyazdani42/nvim-web-devicons', -- Icons for lualine

  --TODO: Configuration
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup(Options.others.comment)
    end
  },                      -- "gc" to comment visual regions/lines
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  --TODO: Configuration
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup(Options.telescope)
    end
  },

  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  --TODO: Configuration
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },
}

Options = {}
Options.bufferline = require('lua/plugins/configs/bufferline')
Options.nvimtree = require('lua/plugins/configs/nvimtree')
Options.treesitter = require('lua/plugins/configs/treesitter')
Options.cmp = require('lua/plugins/configs/cmp')
Options.which_key = require('lua/plugins/configs/which_key')
Options.telescope = require('lua/plugins/configs/telescope')
Options.nvterm = require('lua/plugins/configs/nvterm')
Options.lualine = require('lua/plugins/configs/lualine')
Options.others = require('lua/plugins/configs/others')

return require('packer').startup(function(use)
  use { "wbthomason/packer.nvim" }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    config = function()
      require('nvim-treesitter').setup(Options.treesitter)
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- highlighting of code comments like 'HACK,' 'BUG,' etc.
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end
  }

  --TODO: Configuration
  use 'simrat39/rust-tools.nvim'
  --TODO: Configuration
  use 'puremourning/vimspector'
  --TODO: Configuration
  use 'mfussenegger/nvim-dap'

  use {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require('gruvbox').setup(Options.others.gruvbox)
    end
  }

  --TODO: Configuration
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup(Options.others.autopairs)
    end
  }

  use {
    "NvChad/nvterm",
    config = function()
      require('nvterm').setup(Options.nvterm)
    end,
  }

  use 'lewis6991/impatient.nvim' -- faster nvim loading

  --TODO: Configuration
  use {
    'williamboman/mason.nvim',
    run = ":MasonUpdate",
  }

  --TODO: Configuration
  use {
    'williamboman/mason-lspconfig.nvim',
  }

  --TODO: Configuration
  use 'RRethy/vim-illuminate' -- automatic reference highlighting

  --TODO: Configuration
  use {
    'folke/neodev.nvim',
    config = function()
      require('neodev').setup()
    end
  }

  --TODO: Configuration
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      'WhoIsSethDaniel/lualine-lsp-progress.nvim',
      'folke/neodev.nvim',
    },
  }

  --TODO: Configuration
  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'nvim-lspconfig',
      'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'hrsh7th/nvim-cmp' },
    config = function()
      require('cmp').setup(Options.cmp)
    end
  }

  use { 'L3MON4D3/LuaSnip', run = 'make install_jsregexp' }

  --TODO: Configuration
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup(Options.nvimtree)
    end,
  }


  --TODO: Configuration
  use {
    "folke/which-key.nvim",
    config = function()
      require('which-key').setup(Options.which_key)
    end
  }

  --TODO: Configuration
  use {
    'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup(Options.bufferline)
    end
  }

  -- Git related plugins
  --TODO: Configuration
  use 'tpope/vim-fugitive'

  --TODO: Configuration
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup(Options.others.gitsigns)
    end
  }

  -- Add indentation guides even on blank lines
  --TODO: Configuration
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup(Options.others.blankline)
    end
  }

  -- Fancier statusline
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup(Options.lualine)
    end
  }

  use 'kyazdani42/nvim-web-devicons' -- Icons for lualine

  --TODO: Configuration
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup(Options.others.comment)
    end
  }                      -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  --TODO: Configuration
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup(Options.telescope)
    end
  }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  --TODO: Configuration
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

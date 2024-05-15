local cfgs = "plugins.configs."
local is_lazy = false

return {
    {
        "nvim-tree/nvim-web-devicons",
        lazy = is_lazy,
        enabled = true,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = is_lazy,
        dependencies = { "nvim-treesitter/nvim-treesitter-context", "nvim-treesitter/nvim-treesitter-textobjects" },
        event = { "VimEnter" },
        build = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
        init = function(plugin)
            require("lazy.core.loader").add_to_rtp(plugin)
            require("nvim-treesitter.query_predicates")
            require("core.utils").load_mappings("treesitter")
        end,
        config = require(cfgs .. "_treesitter"),
    },
    {
        -- Additional text objects via treesitter
        "nvim-treesitter/nvim-treesitter-textobjects",
        lazy = is_lazy,
    },
    {
        "L3MON4D3/LuaSnip",
        lazy = is_lazy,
        dependencies = { "rafamadriz/friendly-snippets" },
        build = "make install_jsregexp",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({
                -- NOTE: Why won't the friendly-snippets load without explicity setting the path?
                paths = { "~/.config/nvim/luasnippets", "~/.local/share/nvim/lazy/friendly-snippets" },
            })
        end,
    },
    -- highlighting of code comments like 'HACK,' 'BUG,' etc.
    {
        "folke/todo-comments.nvim",
        lazy = is_lazy,
        dependencies = { "nvim-lua/plenary.nvim" },
        event = { "BufReadPre", "BufNewFile" },
        init = function()
            require("core.utils").load_mappings("todo_comments")
        end,
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "HiPhish/debugpy.nvim",
        lazy = is_lazy,
        ft = "python",
    },
    {
        "mfussenegger/nvim-dap-python",
        lazy = is_lazy,
        dependencies = { "HiPhish/debugpy.nvim" },
        ft = "python",
    },
    {
        "luckasRanarison/tree-sitter-hyprlang",
        lazy = is_lazy,
        -- TODO: requires experimentation
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "simrat39/rust-tools.nvim",
        lazy = is_lazy,
    },
    {
        "mbbill/undotree",
        lazy = is_lazy,
        cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeHide", "UndotreeFocus", "UndotreePersistUndo" },
        init = function()
            vim.g.undotree_SetFocusWhenToggle = 1
            require("core.utils").load_mappings("undo_tree")
        end,
    },
    {
        "epwalsh/obsidian.nvim",
        lazy = is_lazy,
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-treesitter",
        },
        event = {
            "BufReadPost " .. vim.fn.expand("~") .. "/OneDrive/Documents/roman-obsidian/**.md",
            "BufNewFile " .. vim.fn.expand("~") .. "/OneDrive/Documents/roman-obsidian/**.md",
        },
        init = function()
            require("core.utils").load_mappings("obsidian")
        end,
        config = require(cfgs .. "_obsidian"),
    },
    {
        "stevearc/conform.nvim",
        lazy = is_lazy,
        event = "VeryLazy",
        config = require(cfgs .. "_conform"),
    },
    {
        "tpope/vim-characterize",
        lazy = is_lazy,
        event = "UIEnter",
    },
    {
        "andymass/vim-matchup",
        lazy = is_lazy,
        event = "VeryLazy",
    },
    {
        "jakewvincent/mkdnflow.nvim",
        lazy = is_lazy,
        ft = "markdown",
        config = function()
            require("core.utils").load_mappings("mkdnflow")
            require("mkdnflow").setup({
                -- NOTE: Probably don't set maps here
                mappings = {
                    MkdnEnter = false,
                    MkdnTab = false,
                    MkdnSTab = false,
                    MkdnNextLink = false,
                    MkdnPrevLink = false,
                    MkdnNextHeading = false,
                    MkdnPrevHeading = false,
                    MkdnGoBack = false,
                    MkdnGoForward = false,
                    MkdnCreateLink = false, -- see MkdnEnter
                    MkdnCreateLinkFromClipboard = false,
                    MkdnFollowLink = false, -- see MkdnEnter
                    MkdnDestroyLink = false,
                    MkdnTagSpan = false,
                    MkdnMoveSource = false,
                    MkdnYankAnchorLink = false,
                    MkdnYankFileAnchorLink = false,
                    MkdnIncreaseHeading = false,
                    MkdnDecreaseHeading = false,
                    MkdnToggleToDo = false,
                    MkdnNewListItem = false,
                    MkdnNewListItemBelowInsert = false,
                    MkdnNewListItemAboveInsert = false,
                    MkdnExtendList = false,
                    MkdnUpdateNumbering = false,
                    MkdnTableNextCell = false,
                    MkdnTablePrevCell = false,
                    MkdnTableNextRow = false,
                    MkdnTablePrevRow = false,
                    MkdnTableNewRowBelow = false,
                    MkdnTableNewRowAbove = false,
                    MkdnTableNewColAfter = false,
                    MkdnTableNewColBefore = false,
                    MkdnFoldSection = false,
                    MkdnUnfoldSection = false,
                },
            })
        end,
    },
    {
        "lukas-reineke/headlines.nvim",
        lazy = is_lazy,
        dependencies = "nvim-treesitter/nvim-treesitter",
        ft = "markdown",
        config = true,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = is_lazy,
        enabled = true,
        event = "VimEnter",
        config = require(cfgs .. "_gruvbox"),
    },
    {
        "sainnhe/gruvbox-material",
        lazy = is_lazy,
        enabled = false,
        event = "VimEnter",
        config = function()
            vim.cmd("colorscheme gruvbox-material")
        end,
    },
    {
        "catppuccin/nvim",
        lazy = is_lazy,
        enabled = false,
        event = "VimEnter",
        config = function()
            vim.cmd.colorscheme("catppuccin-macchiato")
        end,
    },
    {
        "mfussenegger/nvim-dap",
        lazy = is_lazy,
        event = "VeryLazy",
        init = function()
            require("core.utils").load_mappings("nvim_dap")
        end,
        config = require(cfgs .. "_nvim-dap"),
    },
    {
        "mfussenegger/nvim-lint",
        lazy = is_lazy,
    },
    {
        "rshkarin/mason-nvim-lint",
        lazy = is_lazy,
        dependencies = "mfussenegger/nvim-lint",
        event = "LspAttach",
        config = require(cfgs .. "_nvim-lint"),
    },
    {
        "rcarriga/nvim-dap-ui",
        lazy = is_lazy,
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            require("dapui").setup()
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = is_lazy,
        cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" },
        init = function()
            require("core.utils").load_mappings("nvim_tree")
        end,
        config = require(cfgs .. "_nvim-tree"),
    },
    {
        "NvChad/nvterm",
        lazy = is_lazy,
        init = function()
            require("core.utils").load_mappings("nvterm")
        end,
        config = require(cfgs .. "_nvterm"),
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = is_lazy,
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
        init = function()
            require("core.utils").load_mappings("telescope")
        end,
        cmd = { "Telescope", "TodoTelescope" },
        config = require(cfgs .. "_telescope"),
    },
    {
        "williamboman/mason.nvim",
        lazy = is_lazy,
        build = ":MasonUpdate",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = is_lazy,
        dependencies = {
            "williamboman/mason.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = require(cfgs .. "_mason-lspconfig"),
    },
    {
        "RRethy/vim-illuminate",
        lazy = is_lazy, -- automatic reference highlighting
        enabled = false,
    },
    -- TODO: Set this up to work properly
    {
        "folke/neodev.nvim",
        lazy = is_lazy,
        config = require(cfgs .. "_neodev"),
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = is_lazy,
        event = "VeryLazy",
        config = require(cfgs .. "_lualine"),
    },
    {
        -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        lazy = is_lazy,
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/lualine-lsp-progress.nvim",
            "L3MON4D3/LuaSnip",
            --'folke/neodev.nvim',
        },
        config = require(cfgs .. "_mason-lspconfig"),
    },
    {
        "tpope/vim-fugitive",
        lazy = is_lazy,
        enabled = false,
    },
    {
        "kdheepak/lazygit.nvim",
        lazy = is_lazy,
        event = "VeryLazy",
        init = function()
            require("core.utils").load_mappings("lazygit")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = is_lazy,
        ft = "gitcommit",
        config = require(cfgs .. "_gitsigns"),
    },
    -- Add indentation guides even on blank lines
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = is_lazy,
        event = "VeryLazy",
        main = "ibl",
        config = function()
            require("ibl").setup({
                indent = {
                    char = "┊",
                },
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        lazy = is_lazy,
        enabled = false,
        event = "InsertEnter",
        config = require(cfgs .. "_autopairs"),
    },
    {
        "akinsho/bufferline.nvim",
        lazy = is_lazy,
        event = { "VeryLazy" },
        config = require(cfgs .. "_bufferline"),
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = is_lazy,
        dependencies = { "nvim-treesitter" },
        enabled = false,
        config = function()
            require("treesitter-context").setup()
        end,
    },
    {
        "numToStr/Comment.nvim",
        lazy = is_lazy,
        event = { "VeryLazy", "BufNewFile" },
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "tpope/vim-sleuth",
        lazy = is_lazy, -- Detect tabstop and shiftwidth automatically
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        lazy = is_lazy,
        build = "make",
        cond = vim.fn.executable("make") == 1,
    },
    {
        "folke/which-key.nvim",
        lazy = is_lazy,
        keys = { '"', "`", "d", "y", "g", "v", "z", "c", "<c-w>", "<c-r>", "!", "[", "]", "<leader>" },
        config = require(cfgs .. "_which-key"),
    },
}

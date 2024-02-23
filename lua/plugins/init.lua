local cfgs = "plugins.configs."
return {
    {
        "nvim-tree/nvim-web-devicons",
        enabled = true,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "nvim-treesitter/nvim-treesitter-context", "nvim-treesitter/nvim-treesitter-textobjects" },
        event = { "UIEnter" },
        build = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
        init = function(plugin)
            require("lazy.core.loader").add_to_rtp(plugin)
            require("nvim-treesitter.query_predicates")
            require("core.utils").load_mappings("treesitter")
        end,
        config = require(cfgs .. "treesitter"),
    },
    {
        -- Additional text objects via treesitter
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    {
        "L3MON4D3/LuaSnip",
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
        dependencies = { "nvim-lua/plenary.nvim" },
        event = { "BufReadPre", "BufNewFile" },
        init = function()
            require("core.utils").load_mappings("todo_comments")
        end,
        opts = function()
            require("todo-comments").setup()
        end,
    },
    {
        "HiPhish/debugpy.nvim",
        ft = "python",
    },
    {
        "mfussenegger/nvim-dap-python",
        dependencies = { "HiPhish/debugpy.nvim" },
        ft = "python",
    },
    {
        "luckasRanarison/tree-sitter-hyprlang",
        -- TODO: requires experimentation
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "simrat39/rust-tools.nvim",
    },
    {
        "mbbill/undotree",
        cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeHide", "UndotreeFocus", "UndotreePersistUndo" },
        init = function()
            vim.g.undotree_SetFocusWhenToggle = 1
            require("core.utils").load_mappings("undo_tree")
        end,
    },
    {
        "epwalsh/obsidian.nvim",
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
        config = function()
            require("obsidian").setup({
                workspaces = {
                    {
                        name = "roman-obsidian",
                        path = "/home/roman/OneDrive/Documents/roman-obsidian",
                    },
                },
                follow_url_func = function(url)
                    -- Open the URL in the default web browser.
                    vim.fn.jobstart({ "xdg-open", url })
                end,
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        config = require(cfgs .. "conform"),
    },
    {
        "jakewvincent/mkdnflow.nvim",
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
        dependencies = "nvim-treesitter/nvim-treesitter",
        ft = "markdown",
        config = true,
    },
    {
        "ellisonleao/gruvbox.nvim",
        enabled = true,
        event = "VimEnter",
        config = require(cfgs .. "gruvbox"),
    },
    {
        "sainnhe/gruvbox-material",
        enabled = false,
        event = "VimEnter",
        config = function()
            vim.cmd("colorscheme gruvbox-material")
        end,
    },
    {
        "catppuccin/nvim",
        enabled = false,
        event = "VimEnter",
        config = function()
            vim.cmd.colorscheme("catppuccin-macchiato")
        end,
    },
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        init = function()
            require("core.utils").load_mappings("nvim_dap")
        end,
        config = require(cfgs .. "nvim-dap"),
    },
    {
        "mfussenegger/nvim-lint",
    },
    {
        "rshkarin/mason-nvim-lint",
        dependencies = "mfussenegger/nvim-lint",
        event = "LspAttach",
        config = require(cfgs .. "nvim-lint"),
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap" },
        opts = function()
            require("dapui").setup()
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" },
        init = function()
            require("core.utils").load_mappings("nvim_tree")
        end,
        config = require(cfgs .. "nvim-tree"),
    },
    {
        "NvChad/nvterm",
        init = function()
            require("core.utils").load_mappings("nvterm")
        end,
        config = require(cfgs .. "nvterm"),
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
        init = function()
            require("core.utils").load_mappings("telescope")
        end,
        cmd = { "Telescope", "TodoTelescope" },
        config = require(cfgs .. "telescope"),
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
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
        config = require(cfgs .. "mason-lspconfig"),
    },
    {
        "RRethy/vim-illuminate", -- automatic reference highlighting
        enabled = false,
    },
    -- TODO: Set this up to work properly
    {
        "folke/neodev.nvim",
        config = require(cfgs .. "neodev"),
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = require(cfgs .. "lualine"),
    },
    {
        -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
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
    },
    {
        "kdheepak/lazygit.nvim",
        event = "VeryLazy",
        init = function()
            require("core.utils").load_mappings("lazygit")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        ft = "gitcommit",
        opts = require(cfgs .. "gitsigns"),
    },
    -- Add indentation guides even on blank lines
    {
        "lukas-reineke/indent-blankline.nvim",
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
        event = "InsertEnter",
        config = require(cfgs .. "autopairs"),
    },
    {
        "akinsho/bufferline.nvim",
        event = { "VeryLazy" },
        config = require(cfgs .. "bufferline"),
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function(_, opts)
            require("treesitter-context").setup(opts)
        end,
    },
    {
        "numToStr/Comment.nvim",
        event = { "VeryLazy" },
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = vim.fn.executable("make") == 1,
    },
    {
        "folke/which-key.nvim",
        keys = { '"', "`", "d", "y", "g", "v", "z", "c", "<c-w>", "<c-r>", "!", "[", "]", "<leader>" },
        config = require(cfgs .. "which-key"),
    },
}

local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

g.vimspector_enable_mappings = "HUMAN"
-- Gives more color options
opt.termguicolors = true

-- detect changes to file outside of neovim
opt.autoread = true

-- Make line numbers default
g.number = true

-- Enable mouse mode
opt.mouse = "a"

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Autoindentation
opt.autoindent = false

-- Automatically change dir to dir of current file
opt.autochdir = true

-- Relative line numbering
opt.relativenumber = true
opt.number = true

-- Sets clipboard to X11 systejm clipboard (requires xclip)
opt.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true

opt.smartcase = true
-- Decrease update time

g.updatetime = 250
g.signcolumn = "yes"

g.loaded_netrwPlugin = 1
g.loaded_netrw = 1
-- Treesitter handles folds
g.foldmethod = "expr"
g.foldexpr = "nvim_treesitter#foldexpr()"

-- Set colorscheme
opt.termguicolors = true
opt.background = "dark" -- or "light" for light mode
opt.syntax = "on"
--vim.cmd.syntax("on")

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

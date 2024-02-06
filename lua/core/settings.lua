---@diagnostic disable: assign-type-mismatch

-- # global options # --
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.number = true
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.undotree_SetFocusWhenToggle = 1

-- # lua-style options # --
vim.opt.termguicolors = true
vim.opt.autoread = true
vim.opt.mouse = "a"
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.undofile = true
vim.opt.autoindent = true
vim.opt.autochdir = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.conceallevel = 2
vim.opt.termguicolors = true
vim.opt.completeopt = "menuone,noselect"
vim.opt.splitright = true
vim.opt.splitbelow = false
vim.opt.spellfile = vim.fn.stdpath("config") .. "/extra/spell/en.UTF-8.add"

-- # Other Vim Options # --
vim.o.updatetime = 250
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

---@diagnostic disable: assign-type-mismatch
local opt = vim.opt
local o = vim.o

-- # global options # --
local g = vim.g
g.mapleader = " "
g.maplocalleader = " "
g.number = true
g.loaded_netrwPlugin = 1
g.loaded_netrw = 1
g.undotree_SetFocusWhenToggle = 1

-- # lua-style options # --
opt.termguicolors = true
opt.autoread = true
opt.mouse = "a"
opt.breakindent = true
opt.tabstop = 2
opt.expandtab = true
opt.softtabstop = 2
opt.shiftwidth = 2
opt.undofile = true
opt.autoindent = false
opt.autochdir = true
opt.relativenumber = true
opt.number = true
opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.smartcase = true
opt.conceallevel = 1
opt.termguicolors = true
opt.background = "dark" -- or "light" for light mode
opt.syntax = "on"
opt.completeopt = "menuone,noselect"

-- # Other Vim Options # --
o.updatetime = 250
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"

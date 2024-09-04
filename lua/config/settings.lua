-- Set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Nvim uses system clipboard
vim.o.clipboard = "unnamedplus"
-- Focus UndoTree when toggling it
vim.g.undotree_SetFocusWhenToggle = 1
-- Better colors
vim.opt.termguicolors = true
-- Automatically detect when files have been edited
vim.opt.autoread = true
-- Allow use of the mouse
vim.opt.mouse = "a"
-- Wrapped lines align with start of line
vim.opt.breakindent = true
-- Tabs are 4 characters wide
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
-- Tabs are expanded to spaces
vim.opt.expandtab = true
-- 4 space indents
vim.opt.shiftwidth = 4
-- Store undo history
vim.opt.undofile = true
-- New lines have same indent as previous
vim.opt.autoindent = true
-- Auto change dir based on current file
vim.opt.autochdir = true
-- Relative line numbering
vim.opt.relativenumber = true
-- Line numbers
vim.opt.number = true
-- Ignore word case in searches
vim.opt.ignorecase = true
-- Case-insensitive only for lowercase queries
vim.opt.smartcase = true
-- Allows extensions to format text
vim.opt.conceallevel = 2
-- Completion menu on one option, and insert longest common text
vim.opt.completeopt = "menuone,longest"
-- V-Splits open to the right
vim.opt.splitright = true
-- H-Splits open below
vim.opt.splitbelow = false
-- Point Nvim to spell file
vim.opt.spellfile = vim.fn.stdpath("config") .. "/en.UTF-8.add"
-- Update swap file if no text typed for 250ms
vim.o.updatetime = 250
-- Folds are handled by treesitter
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

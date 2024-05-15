vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.vimspector_enable_mappings = "HUMAN"
-- Gives more color options
vim.opt.termguicolors = true

-- detect changes to file outside of neovim
vim.opt.autoread = true

-- Make line numbers default
vim.g.number = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Autoindentation
vim.opt.autoindent = false

-- Automatically change dir to dir of current file
vim.opt.autochdir = true

-- Relative line numbering
vim.opt.relativenumber = true
vim.opt.number = true

-- Sets clipboard to X11 systejm clipboard (requires xclip)
vim.opt.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true

vim.opt.smartcase = true
-- Decrease update time

vim.g.updatetime = 250
vim.g.signcolumn = "yes"

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
-- Treesitter handles folds
vim.g.foldmethod = "expr"
vim.g.foldexpr = "nvim_treesitter#foldexpr()"

-- Set colorscheme
vim.opt.termguicolors = true
vim.opt.background = "dark" -- or "light" for light mode
vim.opt.syntax = "on"
--vim.cmd.syntax("on")

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   -- bootstrap lazy.nvim
   -- stylua: ignore
   vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
      lazypath })
end

vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

local lazyopts = {
   change_detection = {
      -- automatically check for config file changes and reload the ui
      enabled = true,
      notify = false, -- get a notification when changes are found
   },
}

require("lazy").setup("plugins", lazyopts)

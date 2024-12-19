--- NOTE: Collection of smaller utilities

return {
  {
    "tpope/vim-characterize", -- NOTE: Shows detailed unicode information about characters

  },
  {
    "ellisonleao/gruvbox.nvim", -- NOTE: Nvim theme
    priority = 1000,
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
    end,
    opts = true,
  },
{ "echasnovski/mini.nvim", version = false }, -- NOTE: Collection of useful modules
}

--- NOTE: Fast and simple syntax highlighting
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VimEnter",
  keys = {
    { "[d", vim.diagnostic.goto_prev },
    { "]d", vim.diagnostic.goto_next },
    { "<leader>e", vim.diagnostic.open_float },
    -- {'n', '<leader>q', vim.diagnostic.setloclist}
  },
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "rust", "lua", "vim", "vimdoc", "query", "json", "jsonc", "css", "html", "python" },
      auto_install = true,
      sync_install = false,
      ignore_install = {},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

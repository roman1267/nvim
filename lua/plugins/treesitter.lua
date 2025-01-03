--- NOTE: Fast and simple syntax highlighting
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "rust", "lua", "vim", "vimdoc", "query", "json", "jsonc", "css", "html", "python" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

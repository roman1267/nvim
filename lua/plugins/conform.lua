--- NOTE: Configure and run formatters for code
return {
  "stevearc/conform.nvim",
  cmd = "ConformInfo",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd", "prettier" },
      json = { "prettierd" },
      -- prettierd breaks jsonc files
      jsonc = { "prettier" },
      css = { "prettierd", "prettier" },
      bash = { "shfmt" },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      stop_after_first = true,
      lsp_format = "fallback",
    },
  },
}

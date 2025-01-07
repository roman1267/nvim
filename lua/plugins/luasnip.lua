return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  build = "make install_jsregexp",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("luasnip").setup()
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = {
        vim.fn.expand("$XDG_CONFIG_HOME") .. "" .. "nvim/snippets/",
        vim.fn.expand("$XDG_DATA_HOME") .. "" .. "nvim/lazy/friendly-snippets/",
      },
    })
  end,
}

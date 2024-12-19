return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  config = {
    require("config.utils").load_mappings("telescope"),
  },
}

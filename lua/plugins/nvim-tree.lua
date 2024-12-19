--- NOTE: File tree for Nvim
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    update_focused_file = {
      enable = true,
      update_root = {
        enable = false,
        ignore_list = {},
      },
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    require("config.utils").load_mappings("nvim_tree")
  end,
}

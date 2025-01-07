--- NOTE: File tree for Nvim
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<C-f>",
      "<cmd> NvimTreeToggle <cr>",
      { silent = true },
    },
  },
  opts = {
    update_focused_file = {
      enable = true,
      update_root = {
        enable = true,
        ignore_list = {},
      },
    },
  },
}

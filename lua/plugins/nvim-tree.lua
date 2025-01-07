--- NOTE: File tree for Nvim
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  -- cmd = {
  --   "NvimTreeClipboard",
  --   "NvimTreeClose",
  --   "NvimTreeCollapse",
  --   "NvimTreeCollapseKeepBuffers",
  --   "NvimTreeFindFile",
  --   "NvimTreeFindFileToggle",
  --   "NvimTreeFocus",
  --   "NvimTreeHiTest",
  --   "NvimTreeOpen",
  --   "NvimTreeRefresh",
  --   "NvimTreeResize",
  --   "NvimTreeToggle",
  -- },
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

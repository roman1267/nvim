--- NOTE: Visualize and traverse undo history
return {
  "mbbill/undotree",
  cmd = {
    "UndotreeFocus",
    "UndotreeHide",
    "UndotreePersistUndo",
    "UndotreeShow",
    "UndotreeToggle",
  },
  keys = {
    {
      "<leader>u",
      "<cmd>UndotreeToggle<cr>",
      { desc = "Visualize undo history" },
    },
  },
}

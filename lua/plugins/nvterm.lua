--- NOTE: Easy terminal integration

return {
  "NvChad/nvterm",
  opts = {},
  config = {
    require("config.utils").load_mappings("nvterm"),
  },
}

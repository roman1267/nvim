return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    "BufReadPost " .. vim.fn.expand("~") .. "/OneDrive/Documents/roman-obsidian/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/OneDrive/Documents/roman-obsidian/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "roman-obsidian",
        path = "/home/roman/OneDrive/Documents/roman-obsidian/",
      },
    },
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({ "xdg-open", url })
    end,
    ---@param opts {path: string, label: string, id: string|?}
    ---@return string format the format for markdown links
    markdown_link_func = function(opts)
      -- Replace all spaces with %20 for cross-compatibility
      opts.path = string.gsub(opts.path, "%s", "%%20")
      return string.format("[%s](%s)", opts.label, opts.path)
    end,
  },
  config = function(opts)
    require("obsidian").setup(opts)
    require("config.utils").load_mappings("obsidian")
  end,
}

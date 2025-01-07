--- NOTE: Collection of find utils
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  cmd = { "Telescope" },
  keys = {
    {
      "<leader>?",
      function()
        return require("telescope.builtin").oldfiles()
      end,
      { desc = "[?] Find recently opened files" },
    },

    {
      "<leader><space>",
      function()
        return require("telescope.builtin").buffers()
      end,
      { desc = "[ ] Find existing buffers" },
    },

    {
      "<leader>/",
      function()
        return require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      { desc = "[/] Fuzzy search in current buffer]" },
    },

    {
      "<leader>ff",
      function()
        return require("telescope.builtin").find_files({
          cwd = require("telescope.utils").buffer_dir(),
          hidden = true,
        })
      end,
      { desc = "[F]ind [F]iles in the current directory" },
    },

    {
      "<leader>fh",
      function()
        return require("telescope.builtin").help_tags()
      end,
      { desc = "[F]ind [H]elp" },
    },

    {
      "<leader>fw",
      function()
        return require("telescope.builtin").grep_string()
      end,
      { desc = "[F]ind current [W]ord" },
    },

    {
      "<leader>fg",
      function()
        return require("telescope.builtin").live_grep()
      end,
      { desc = "[F]ind by [G]rep in [C]wd" },
    },

    {
      "<leader>fd",
      function()
        return require("telescope.builtin").diagnostics()
      end,
      { desc = "[F]ind [D]iagnostics" },
    },

    {
      "<leader>fm",
      function()
        return require("telescope.builtin").keymaps()
      end,
      { desc = "[F]ind [M]aps" },
    },
  },
}

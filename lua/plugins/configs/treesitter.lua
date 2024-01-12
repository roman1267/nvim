local opts = {
   -- Add languages to be installed here that you want installed for treesitter
   ensure_installed = { "lua", "python", "rust", "vim", "hyprlang" },
   highlight = { enable = true },
   indent = { enable = true, disable = { "python" } },
   incremental_selection = {
      enable = true,
      keymaps = {
         init_selection = "<c-space>",
         node_incremental = "<c-space>",
         scope_incremental = "<c-s>",
         node_decremental = "<c-backspace>",
      },
   },
   textobjects = {
      select = {
         enable = true,
         lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
         keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
         },
      },
      move = {
         enable = true,
         set_jumps = true, -- whether to set jumps in the jumplist
         goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
         },
         goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
         },
         goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
         },
         goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
         },
      },
      swap = {
         enable = true,
         swap_next = {
            ["<leader>a"] = "@parameter.inner",
         },
         swap_previous = {
            ["<leader>A"] = "@parameter.inner",
         },
      },
   },
}

local setup = function()
   local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
   parser_config.hypr = {
      install_info = {
         url = "https://github.com/luckasRanarison/tree-sitter-hyprlang",
         files = { "src/parser.c" },
         branch = "master",
      },
      filetype = "hypr",
   }
   if type(opts.ensure_installed) == "table" then
      ---@type table<string, boolean>
      local added = {}
      opts.ensure_installed = vim.tbl_filter(function(lang)
         if added[lang] then
            return false
         end
         added[lang] = true
         return true
      end, opts.ensure_installed)
   end
end

return function()
   setup()
   require("core.utils").lazy_load("nvim-treesitter.configs", opts)
end

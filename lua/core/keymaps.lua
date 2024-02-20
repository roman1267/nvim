local ft_cmds = {
   python = "python3 " .. vim.fn.shellescape(vim.fn.expand("%:p")),
   rust = "bacon " .. vim.fn.shellescape(vim.fn.expand("%:p:h")),
}

local mappings = {
   -------------------- global options --------------------
   global = {
      -- {{ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }}
      { { "n", "v" }, "<leader>qa", "<cmd>qa!<CR>", {
         desc = "force [Q]uit [A]ll",
      } },
      { { "n", "v", "i" }, "<Esc>", "<Esc><cmd>nohl<CR>", {
         desc = "Clear highlights",
      } },
      { { "n" }, "<leader>hi", "<cmd>edit ~/.config/nvim/init.lua<CR>", { desc = "go to init.lua" } },
      {
         { "n" },
         "<leader>hd",
         function()
            vim.cmd(":cd ~/.config/nvim/")
            vim.cmd(":NvimTreeOpen")
         end,
         { desc = "go to init.lua" },
      },
      { { "n", "v" }, "/", "<cmd>set nohlsearch<CR>/", { desc = "no highlights when searching" } },
   },
   buffers = {
      -------------------- buffer navigation --------------------
      -- Remap for dealing with word wrap
      { "n", "k", "v:count == 0 ? 'gk' : 'k'", {
         expr = true,
         silent = true,
      } },
      { "n", "j", "v:count == 0 ? 'gj' : 'j'", {
         expr = true,
         silent = true,
      } },
      -------------------- buffer options --------------------
      { { "n", "v" }, "<leader>bp", "<cmd> bprev <CR>", {
         desc = "[B]uffer [P]revious",
      } },
      { { "n", "v" }, "[b", "<cmd> bprev <CR>", {
         desc = "Previous buffer",
      } },
      { { "n", "v" }, "<leader>bn", "<cmd> bnext <CR>", {
         desc = "[B]uffer [N]ext",
      } },
      { { "n", "v" }, "]b", "<cmd> bnext <CR>", {
         desc = "Next buffer",
      } },
      { { "n", "v" }, "<leader>bc", "<cmd> enew <CR>", {
         desc = "[B]uffer [C]reate",
      } },
      { { "n", "v" }, "<leader>bd", "<c-w>T", {
         desc = "[B]uffer [D]etach to new tab",
      } },
      {
         { "n", "v" },
         "\\b",
         function()
            local bufnr = function()
               local buffers = {}
               ---@diagnostic disable-next-line: param-type-mismatch
               for buffer = 1, vim.fn.bufnr("$") do
                  local is_listed = vim.fn.buflisted(buffer) == 1
                  if is_listed then
                     table.insert(buffers, buffer)
                  end
               end
               return #buffers
            end

            local last_buf = vim.fn.bufnr("%")
            local last_buf_name = vim.api.nvim_buf_get_name(last_buf)
            if bufnr() == 1 and string.find(last_buf_name, "NvimTree") == nil then
               vim.cmd("qall")
            end

            vim.cmd("bn")
            vim.cmd(string.format("silent! bd %s", last_buf))

            if bufnr() == 1 then
               vim.cmd("silent! NvimTreeClose")
               vim.cmd("silent! close")
            end
         end,
         { desc = "Intelligently close current buffer" },
      },
      {
         { "n", "v" },
         "\\q",
         function()
            vim.cmd(":qall")
         end,
         { desc = "[B]uffer [Q]uit" },
      },
   },
   splits = {
      -------------------- splits general --------------------
      { "n", "<leader>sv", "<cmd>vsp #<CR>", {
         desc = "[S]plit previous buffer [V]ertically",
      } },
      { "n", "<leader>sh", "<cmd>sp #<CR>", {
         desc = "[S]plit previous buffer [H]orizontally",
      } },
      { "n", "<leader>so", "<cmd>only<CR>", {
         desc = "keep current [S]plit [O]nly",
      } },
      { "n", "<leader>sn", "<cmd>vnew<CR>", {
         desc = "keep current [S]plit [N]ew",
      } },
      -------------------- resizing splits --------------------
      { "n", "<C-Up>", "<cmd>resize +2<CR>" },
      { "n", "<C-Down>", "<cmd>resize -2<CR>" },
      { "n", "<C-Left>", "<cmd>vertical resize -2<CR>" },
      { "n", "<c-Right>", "<CMD>vertical resize +2<CR>" },

      -------------------- splits navigation --------------------
      { { "n", "v", "i" }, "<C-h>", "<C-w>h" },
      { { "n", "v", "i" }, "<C-j>", "<C-w>j" },
      { { "n", "v", "i" }, "<C-k>", "<C-w>k" },
      { { "n", "v", "i" }, "<C-l>", "<C-w>l" },
   },

   -------------------- tab options --------------------
   tabs = {
      { { "n", "v" }, "<leader>tp", "<cmd> tabp <CR>", { desc = "[T]ab [P]revious" } },
      { { "n", "v" }, "<leader>tn", "<cmd> tabn <CR>", { desc = "[T]ab [N]ext" } },
      {
         { "n", "v" },
         "<leader>tc",
         function()
            vim.cmd("tabnew")
            vim.cmd("cd")
         end,
         { desc = "[T]ab [C]reate" },
      },
      {
         { "n", "v" },
         "<leader>tq",
         function()
            vim.cmd("tabclose")
            vim.cmd("tabp")
         end,
         { desc = "[T]ab [Q]uit" },
      },
   },
   -------------------- nvterm --------------------
   nvterm = {
      {
         "n",
         "<C-m>",
         function()
            require("nvterm.terminal").send(ft_cmds[vim.bo.filetype], "vertical")
         end,
         {
            noremap = true,
            silent = false,
         },
      },
      --{ toggle_modes, '<A-v>', function () terminal.toggle('vertical') end },
      {
         { "n", "t" },
         "<M-i>",
         function()
            require("nvterm.terminal").toggle("float")
         end,
         {
            noremap = true,
            silent = true,
         },
      },
   },
   -------------------- todo comments --------------------
   todo_comments = {
      {
         "n",
         "]t",
         function()
            require("todo-comments").jump_next()
         end,
         { desc = "Next todo comment" },
      },
      {
         "n",
         "[t",
         function()
            require("todo-comments").jump_prev()
         end,
         { desc = "Previous todo comment" },
      },
      { "n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[F]ind [T]odos" } },
   },
   -------------------- nvim-tree --------------------
   nvim_tree = {
      { { "n", "i" }, "<C-f>", "<cmd> NvimTreeToggle <cr>", { silent = true } },
   },
   -------------------- telescope --------------------
   telescope = {
      {
         "n",
         "<leader>?",
         function()
            return require("telescope.builtin").oldfiles()
         end,
         { desc = "[?] Find recently opened files" },
      },

      {
         "n",
         "<leader><space>",
         function()
            return require("telescope.builtin").buffers()
         end,
         { desc = "[ ] Find existing buffers" },
      },

      {
         "n",
         "<leader>/",
         function()
            return require("telescope.builtin").current_buffer_fuzzy_find()
         end,
         { desc = "[/] Fuzzy search in current buffer]" },
      },

      {
         "n",
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
         "n",
         "<leader>fh",
         function()
            return require("telescope.builtin").help_tags()
         end,
         { desc = "[F]ind [H]elp" },
      },

      {
         "n",
         "<leader>fw",
         function()
            return require("telescope.builtin").grep_string()
         end,
         { desc = "[F]ind current [W]ord" },
      },

      {
         "n",
         "<leader>fg",
         function()
            return require("telescope.builtin").live_grep()
         end,
         { desc = "[F]ind by [G]rep in [C]wd" },
      },

      {
         "n",
         "<leader>fd",
         function()
            return require("telescope.builtin").diagnostics()
         end,
         { desc = "[F]ind [D]iagnostics" },
      },

      {
         "n",
         "<leader>fm",
         function()
            return require("telescope.builtin").keymaps()
         end,
         { desc = "Telescope find keymaps" },
      },
      {
         "n",
         "<leader>f'",
         function()
            return require("telescope.builtin").marks()
         end,
         { desc = "Telescope find marks" },
      },
   },
   -------------------- treesitter --------------------
   treesitter = {
      { "n", "[d", vim.diagnostic.goto_prev },
      { "n", "]d", vim.diagnostic.goto_next },
      { "n", "<leader>e", vim.diagnostic.open_float },
      -- {'n', '<leader>q', vim.diagnostic.setloclist}
   },
   -------------------- nvim-dap --------------------
   nvim_dap = {
      -- <leader>d[key] reserved
      {
         { "n" },
         "<leader>du",
         function()
            return require("dapui").toggle()
         end,
         { desc = "[D]ebug toggle [U]I" },
      },
      {
         { "n" },
         "<leader>dt",
         function()
            return require("dap").terminate()
         end,
         { desc = "[D]ebug [T]erminate" },
      },
      {
         { "n" },
         "<leader>dr",
         function()
            return require("dap").restart()
         end,
         { desc = "[D]ebug [R]estart" },
      },
      {
         { "n" },
         "<leader>dbt",
         function()
            return require("dap").toggle_breakpoint()
         end,
         { desc = "[D]ebug [B]reakpoint [T]oggle" },
      },
      {
         { "n" },
         "<leader>dbC",
         function()
            require("dap").set_breakpoint(vim.fn.input({ prompt = "Enter breakpoint condition: " }))
         end,
         { desc = "[D]ebug [B]reakpoint [C]onditional" },
      },
      {
         { "n" },
         "<leader>dbl",
         function()
            require("dap").set_breakpoint(nil, nil, vim.fn.input({ prompt = "Enter log message: " }))
         end,
         { desc = "[D]ebug [B]reakpoint [L]og" },
      },
      {
         { "n" },
         "<leader>dbc",
         function()
            return require("dap").clear_breakpoints()
         end,
         { desc = "[D]ebug [B]reakpoint [c]lear (all)" },
      },
      {
         { "n" },
         "<leader>dc",
         function()
            return require("dap").continue()
         end,
         { desc = "[D]ebug [C]ontinue" },
      },
      {
         "n",
         "<leader>dso",
         function()
            vim.ui.input({ prompt = "Number of steps: " }, function(input)
               return require("dap").step_over({ count = input })
            end)
         end,
         { desc = "[D]ebug [S]tep [O]ver" },
      },
      {
         "n",
         "<leader>dsi",
         function()
            vim.ui.input({ prompt = "Number of steps: " }, function(input)
               return require("dap").step_into({ count = input })
            end)
         end,
         { desc = "[D]ebug [S]tep [I]nto" },
      },
      {
         "n",
         "<leader>dsc",
         function()
            return require("dap").run_to_cursor()
         end,
         { desc = "[D]ebug [S]tep to [C]ursor" },
      },
   },
   -------------------- lazygit --------------------
   lazygit = {
      { "n", "<leader>gc", "<cmd>LazyGit<CR>", { desc = "Lazy[G]it in [C]urrent working directory" } },
      {
         "n",
         "<leader>gf",
         "<cmd>LazyGitCurrentFile<CR>",
         { desc = "Lazy[G]it in project root of current [F]ile" },
      },
      { "n", "<leader>go", "<cmd>LazyGitFilter<CR>", { desc = "Lazy[G]it project c[O]mmits" } },
      { "n", "<leader>gb", "<cmd>LazyGitFilterCurrentFile<CR>", { desc = "Lazy[G]it [B]uffer commits" } },
   },
   -------------------- Obsidian --------------------
   obsidian = {
      { "n", "<leader>olb", "<cmd>ObsidianBackLinks<CR>", { desc = "[O]bsidian [L]inks [B]ack" } },
      { "n", "<leader>oc", "<cmd>ObsidianCheck<CR>", { desc = "[O]bsidian [C]heck" } },
      { "n", "<leader>olf", "<cmd>ObsidianFollowLink<CR>", { desc = "[O]bsidian [L]ink [F]ollow" } },
      { "n", "<leader>ole", ":ObsidianLink ", { desc = "[O]bsidian [L]ink to [E]xisting" } },
      { "n", "<leader>oln", ":ObsidianLinkNew ", { desc = "[O]bsidian [L]ink to [N]ew" } },
      { "n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "[O]bsidian [O]pen" } },
      { "n", "<leader>oi", "<cmd>ObsidianPasteImg<CR>", { desc = "[O]bsidian [P]aste [I]mg" } },
      { "n", "<leader>oqs", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Switch to note" } },
      { "n", "<leader>or", ":ObsidianRename ", { desc = "rename a file across the vault" } },
      { "n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search | create notes in vault" } },
      { "n", "<leader>ot", ":ObsidianTemplate ", { desc = "Paste template into buffer" } },
      { "n", "<leader>ow", ":ObsidianWorkspace ", { desc = "Open a workspace" } },
   },
   -------------------- Undo Tree --------------------
   undo_tree = {
      { "n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" } },
   },
   -------------------- Mkdnflow --------------------
   mkdnflow = {
      -- TODO: fix descs
      { "i", "<CR>", "<cmd>MkdnNewListItem<CR>", { desc = "Creates a new list item" } },
      { "n", "<CR>", "<cmd>MkdnNewListItemBelowInsert<CR>", { desc = "Creates a new list item" } },
      { "n", "o", "<cmd>MkdnNewListItemBelowInsert<CR>", { desc = "Creates a new list item" } },
      { "n", "+", "<cmd>MkdnIncreaseHeading<CR>", { desc = "Increase md heading" } },
      { "n", "-", "<cmd>MkdnDecreaseHeading<CR>", { desc = "Decrease md heading" } },
      { "n", "<M-CR>", "<cmd>MkdnToggleToDo<CR>", { desc = "Toggle md todo" } },
   },
}

return mappings

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
    { { "c" }, "Q", "q!" },
    --{ 'c',          'W',          'wq' },
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
    -- Remap for better scrolling
    { "n", "<C-u>", "<C-u> zz" },
    { "n", "<C-d>", "<C-d> zz" },
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
      "<leader>bq",
      function()
        vim.cmd("bd %")
        vim.cmd("bp")
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
  -------------------- Mkdnflow --------------------
  mkdnflow = {
    { "i", "<CR>", "<cmd>MkdnNewListItem<CR>", { desc = "Creates a new list item" } },
    { "n", "<CR>", "<cmd>MkdnNewListItemBelowInsert<CR>", { desc = "Creates a new list item" } },
    { "n", "o", "<cmd>MkdnNewListItemBelowInsert<CR>", { desc = "Creates a new list item" } },
    { "n", "+", "<cmd>MkdnIncreaseHeading<CR>", { desc = "Increase md heading" } },
    { "n", "-", "<cmd>MkdnDecreaseHeading<CR>", { desc = "Decrease md heading" } },
    { "n", "<M-CR>", "<cmd>MkdnToggleToDo<CR>", { desc = "Toggle md todo" } },
  },
  -------------------- Obsidian --------------------
  obsidian = {
    { "n", "<leader>olb", "<cmd>ObsidianBackLinks<CR>", { desc = "[O]bsidian [L]inks [B]ack" } },
    { "n", "<leader>oc", "<cmd>ObsidianCheck<CR>", { desc = "[O]bsidian [C]heck" } },
    { "n", "<leader>olf", "<cmd>ObsidianFollowLink<CR>", { desc = "[O]bsidian [L]ink [F]ollow" } },
    { "n", "<leader>ole", "<cmd>ObsidianLink<CR>", { desc = "[O]bsidian [L]ink to [E]xisting" } },
    { "n", "<leader>oln", "<cmd>ObsidianLinkNew<CR>", { desc = "[O]bsidian [L]ink to [N]ew" } },
    { "n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "[O]bsidian [O]pen" } },
    { "n", "<leader>oi", "<cmd>ObsidianPasteImg<CR>", { desc = "[O]bsidian [P]aste [I]mg" } },
    { "n", "<leader>oqs", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Switch to note" } },
    { "n", "<leader>or", "<cmd>ObsidianRename<CR>", { desc = "rename a file across the vault" } },
    { "n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search | create notes in vault" } },
    { "n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Paste template into buffer" } },
    { "n", "<leader>ow", "<cmd>ObsidianWorkspace<CR>", { desc = "Open a workspace" } },
  },
}

return mappings

local todo = require('todo-comments')
local terminal = require("nvterm.terminal")
local ft_cmds = {
	python = "python3 " .. vim.fn.expand('%'),
	rust = "bacon",
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
local tbuiltin = require('telescope.builtin')
local tutils = require('telescope.utils')

local mappings = {
	-------------------- global options --------------------
	-- {{ 'n', 'v' }, '<Space>', '<Nop>', { silent = true }}
	{ { 'n', 'v' }, '<leader>qa', '<cmd>qa!<CR>', {
		desc =
		"force [Q]uit [A]ll"
	} },
	{ { 'n', 'v', 'i' }, '<Esc>', '<Esc><cmd>nohl<CR>', {
		desc =
		"Clear highlights"
	} },
	{ { 'c' },      'Q',          'q!' },
	--{ 'c',          'W',          'wq' },
	{ { 'n' },      '<leader>hi', '<cmd>edit ~/.config/nvim/init.lua<CR>', { desc = "go to init.lua" } },
	{ { 'n', 'v' }, '/',          '<cmd>set nohlsearch<CR>/',              { desc = "no highlights when searching" } },

	-------------------- nvterm --------------------
	{ 'n', '<C-l>', function() terminal.send(ft_cmds[vim.bo.filetype]) end,
		{
			noremap = true,
			silent = true
		} },
	--{ toggle_modes, '<A-v>', function () terminal.toggle('vertical') end },
	{ { 'n', 't' }, '<M-i>', function() terminal.toggle('float') end, {
		noremap = true,
		silent = true
	} },

	-------------------- buffer navigation --------------------
	-- Remap for dealing with word wrap
	{ 'n', 'k', "v:count == 0 ? 'gk' : 'k'", {
		expr = true,
		silent = true
	} },
	{ 'n', 'j', "v:count == 0 ? 'gj' : 'j'", {
		expr = true,
		silent = true
	} },
	-- Remap for better scrolling
	{ 'n', '<C-u>', '<C-u> zz' },
	{ 'n', '<C-d>', '<C-d> zz' },

	-------------------- splits general --------------------
	{ 'n', '<leader>sv', '<cmd>vsp #<CR>', {
		desc =
		"[S]plit previous buffer [V]ertically"
	} },
	{ 'n', '<leader>sh', '<cmd>sp #<CR>', {
		desc =
		"[S]plit previous buffer [H]orizontally"
	} },
	{ 'n', '<leader>so', '<cmd>only<CR>', {
		desc =
		"keep current [S]plit [O]nly"
	} },

	-------------------- resizing splits --------------------
	{ 'n',               '<C-Up>',    '<cmd>resize +2<CR>' },
	{ 'n',               '<C-Down>',  '<cmd>resize -2<CR>' },
	{ 'n',               '<C-Left>',  '<cmd>vertical resize -2<CR>' },
	{ 'n',               '<C-Right>', '<cmd>vertical resize +2<CR>' },

	-------------------- split navigation --------------------
	{ { 'n', 'v', 'i' }, '<M-h>',     '<C-w>h' },
	{ { 'n', 'v', 'i' }, '<M-j>',     '<C-w>j' },
	{ { 'n', 'v', 'i' }, '<M-k>',     '<C-w>k' },
	{ { 'n', 'v', 'i' }, '<M-l>',     '<C-w>l' },

	-------------------- buffer options --------------------
	{ { 'n', 'v' }, '<leader>bp', '<cmd> bprev <CR>', {
		desc =
		"[B]uffer [P]revious"
	} },
	{ { 'n', 'v' }, '<leader>bn', '<cmd> bnext <CR>', {
		desc =
		"[B]uffer [N]ext"
	} },
	{ { 'n', 'v' }, '<leader>bc', '<cmd> enew <CR>', {
		desc =
		"[B]uffer [N]ew"
	} },
	{ { 'n',                   'v' }, '<leader>bq', function()
		vim.cmd('bd %')
		vim.cmd('bp')
	end, { desc = "[B]uffer [Q]uit" } },

	-------------------- tab options --------------------
	{ { 'n', 'v' }, '<leader>tp', '<cmd> tabp <CR>', { desc = "[T]ab [P]revious" } },
	{ { 'n', 'v' }, '<leader>tn', '<cmd> tabn <CR>', { desc = "[T]ab [N]ext" } },
	{ { 'n',                  'v' }, '<leader>tc', function()
		vim.cmd('tabnew')
		vim.cmd('cd')
	end, { desc = "[T]ab [C]reate" } },
	{ { 'n',                'v' }, '<leader>tq', function()
		vim.cmd('tabclose')
		vim.cmd('tabp')
	end, { desc = "[T]ab [Q]uit" } },

	-------------------- todo comments --------------------
	{ "n", "]t", function()
		todo.jump_next()
	end, { desc = "Next todo comment" } },
	{ "n", "[t", function()
		todo.jump_prev()
	end, { desc = "Previous todo comment" } },
	{ 'n',          '<leader>ft', '<cmd>TodoTelescope<cr>',    { desc = "[S]earch [T]odos" } },

	-------------------- nvim-tree --------------------
	{ { 'n', 'i' }, '<C-f>',      "<cmd> NvimTreeToggle <cr>", { silent = true } },

	-------------------- telescope --------------------
	{ 'n', '<leader>?', function()
		return tbuiltin.oldfiles()
	end,
		{ desc = '[?] Find recently opened files' } },

	{ 'n', '<leader><space>', function()
		return tbuiltin.buffers()
	end, { desc = '[ ] Find existing buffers' } },

	{ 'n', '<leader>/', function()
		return tbuiltin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
			winblend = 5,
			previewer = false,
		})
	end, { desc = '[/] Fuzzy search in current buffer]' } },

	{ 'n', '<leader>ff', function()
		return tbuiltin.find_files({
			cwd = tutils.buffer_dir(),
			hidden = true
		})
	end, { desc = '[F]ind [F]iles in the current directory' } },

	{ 'n', '<leader>fa', function()
		return tbuiltin.find_files {
			cwd = '~/',
			hidden = true,
		}
	end, { desc = '[F]ind [A]ll files (in home directory)' } },

	{ 'n', '<leader>fh', function()
		return tbuiltin.help_tags()
	end, { desc = '[F]ind [H]elp' } },

	{ 'n', '<leader>fw', function()
		return tbuiltin.grep_string()
	end, { desc = '[F]ind current [W]ord' } },

	{ 'n', '<leader>fg', function()
		return tbuiltin.live_grep()
	end, { desc = '[F]ind by [G]rep' } },

	{ 'n', '<leader>fd', function()
		return tbuiltin.diagnostics()
	end, { desc = '[F]ind [D]iagnostics' } },

	{ 'n', '<leader>fm', function()
		return tbuiltin.keymaps()
	end, { desc = '[F]ind [M]aps' } },

	-------------------- treesitter --------------------
	{ 'n', '[d',        vim.diagnostic.goto_prev },
	{ 'n', ']d',        vim.diagnostic.goto_next },
	{ 'n', '<leader>e', vim.diagnostic.open_float },
	-- {'n', '<leader>q', vim.diagnostic.setloclist}

	-- TODO: update after I've decided which debugger to use
	-------------------- nvim-dap --------------------
	-- <leader>d[key] reserved
	{ { 'n' }, '<leader>du', function()
		return require('dapui').toggle()
	end, { desc = '[D]ebug toggle [U]I' } },
	{ { 'n' }, '<leader>dt', function()
		return require('dap').terminate()
	end, { desc = '[D]ebug [T]erminate' } },
	{ { 'n' }, '<leader>dr', function()
		return require('dap').restart()
	end, { desc = '[D]ebug [R]estart' } },
	{ { 'n' }, '<leader>dbt', function()
		return require('dap').toggle_breakpoint()
	end, { desc = "[D]ebug [B]reakpoint [T]oggle" } },
	{ { 'n' }, '<leader>dbC', function()
		require('dap').set_breakpoint(
			vim.fn.input({ prompt = "Enter breakpoint condition: " }))
	end, { desc = "[D]ebug [B]reakpoint [C]onditional" } },
	{ { 'n' }, '<leader>dbl', function()
		require('dap').set_breakpoint(nil,nil,
			vim.fn.input({ prompt = "Enter log message: " }))
	end, { desc = "[D]ebug [B]reakpoint [L]og" } },
	{ { 'n' }, '<leader>dbc', function()
		return require('dap').clear_breakpoints()
	end, { desc = "[D]ebug [B]reakpoint [c]lear (all)" } },
	{ { 'n' }, '<leader>dc', function()
		return require('dap').continue()
	end, { desc = "[D]ebug [C]ontinue" } },
	{ 'n', '<leader>dso', function()
		vim.ui.input({ prompt = 'Number of steps: ' }, function(input)
			return require('dap').step_over({ count = input })
		end)
	end, { desc = '[D]ebug [S]tep [O]ver' } },
	{ 'n', '<leader>dsi', function()
		vim.ui.input({ prompt = 'Number of steps: ' }, function(input)
			return require('dap').step_into({ count = input })
		end)
	end, { desc = '[D]ebug [S]tep [I]nto' } },
	{ 'n', '<leader>dsc', function()
		return require('dap').run_to_cursor()
	end, { desc = '[D]ebug [S]tep to [C]ursor' } },

	-------------------- fugitive/Git --------------------
	-- <leader>g[key] reserved for fugitive/Git commands
}

for _, mapping in ipairs(mappings) do
	vim.keymap.set(mapping[1], mapping[2], mapping[3], mapping[4])
end

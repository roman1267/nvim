-- TODO: steal from ~/.config/NvChad
-- TODO: move smaller configuations into other (for plugins)
package.path = "/home/romanm/.config/nvim/?.lua;" .. package.path
require('impatient')
require('core/init') -- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
require('plugins')

--[[
###################################
========== LSP settings. ==========
###################################
--]]
local servers = {
	rust_analyzer = {},
	bashls = {},
	html = {},
	pylsp = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}
require('mason').setup()
require("mason-lspconfig").setup {
	ensure_installed = vim.tbl_keys(servers)
}

local cmp = require 'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("mason-lspconfig").setup_handlers {
	-- Custom handlers for specific servers
	["rust_analyzer"] = function()
		require("rust-tools").setup {
			inlay_hints = {
				-- automatically set inlay hints (type hints)
				-- default: true
				auto = true,
				-- Only show inlay hints for the current line
				only_current_line = false,
				-- whether to show parameter hints with the inlay hints or not
				-- default: true
				show_parameter_hints = true,
				-- prefix for parameter hints
				-- default: "<-"
				parameter_hints_prefix = "<- ",
				-- prefix for all the other hints (type, chaining)
				-- default: "=>"
				other_hints_prefix = "=> ",
				-- whether to align to the length of the longest line in the file
				max_len_align = false,
				-- padding from the left if max_len_align is true
				max_len_align_padding = 1,
				-- whether to align to the extreme right or not
				right_align = false,
				-- padding from the right if right_align is true
				right_align_padding = 7,
				-- The color of the hints
				highlight = "Comment",
			},
		}
	end,
	function(server_name) -- default handler
		require("lspconfig")[server_name].setup {
			capabilities = capabilities,
			settings = servers[server_name]
		}
	end
}

-- TODO: TJ Devries video on debugging
-- TODO: Choose between nvim-dap and vimspector--make sure to update packer

-------------------- debug adapter --------------------
local dap = require('dap')
dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
	name = 'lldb'
}

dap.configurations.cpp = {
	{
		name = 'Launch',
		type = 'lldb',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
	},
}

-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- Vimspector options
vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])

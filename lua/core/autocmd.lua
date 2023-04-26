-------------------- LSP augroup --------------------
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
    end

    nmap('<leader>lrn', vim.lsp.buf.rename, '[L]sp [R]e[n]ame')
    nmap('<leader>lca', vim.lsp.buf.code_action, '[L]sp [C]ode [A]ction')

    nmap('<leader>lgd', vim.lsp.buf.definition, '[L]sp [G]oto [D]efinition')
    nmap('<leader>lgr', require('telescope.builtin').lsp_references, '[L]sp [G]oto [R]eferences')
    nmap('<leader>lgi', vim.lsp.buf.implementation, '[L]sp [G]oto [I]mplementation')
    nmap('<leader>ltd', vim.lsp.buf.type_definition, '[L]sp [T]ype [D]efinition')
    nmap('<leader>lds', require('telescope.builtin').lsp_document_symbols, '[L]sp [D]ocument [S]ymbols')
    nmap('<leader>lws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[L]sp [W]orkspace [S]ymbols')

    nmap('K', vim.lsp.buf.hover, '[L]sp Hover Documentation')
    nmap('<leader>lsd', vim.lsp.buf.signature_help, '[L]sp [S]ignature [D]ocumentation')

    -- Lesser used LSP functionality
    nmap('<leader>lgD', vim.lsp.buf.declaration, '[L]sp [G]oto [D]eclaration')
    nmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, '[L]sp [W]orkspace [A]dd Folder')
    nmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, '[L]sp [W]orkspace [R]emove Folder')
    nmap('<leader>lwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[L]sp [W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    nmap('<leader>lf', function()
      vim.lsp.buf.format { async = true }
    end, '[L]sp [F]ormat Buffer')
  end
})
-------------------- highlight on yank augroup --------------------
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-------------------- vimenter augroup --------------------
local vimenter_group = vim.api.nvim_create_augroup('vim_enter', { clear = true })

-- Open nvim-tree instead of netrw
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
      return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
  end,
  group = vimenter_group,
})

-------------------- packer augroup --------------------
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
-- Automatically source and re-compile packer whenever you save this init.lua
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-------------------- tmux augroup --------------------
local tmux_group = vim.api.nvim_create_augroup('Tmux', { clear = true })
-- Automatically source tmux config after making changes to it
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '/home/romanm/.config/tmux/tmux.conf',
  command = "silent! !tmux source-file /home/romanm/.config/tmux/tmux.conf",
  group = tmux_group,
})

-------------------- mkview augroup --------------------
local mklgroup = vim.api.nvim_create_augroup('mkview_loadview_group', { clear = true })

-- saves mkview of a file
vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufWinLeave' }, {
  callback = function()
    vim.cmd('silent! mkview!')
  end,
  group = mklgroup,
  pattern = '*',
})

-- loads saved mkview of a file
vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function()
    vim.cmd('silent! loadview')
  end,
  group = mklgroup,
  pattern = '*',
})

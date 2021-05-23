-- lsp-router.nvim
-- Automatically set pwd to root project directory using LSP

local change_tree_dir = function(dir)
  -- nvim-tree.lua
  if vim.fn.exists('g:loaded_tree') and vim.g.loaded_tree then
    require'nvim-tree.lib'.change_dir(dir)
  end
end

local set_project_dir = function(client)
  local project_root = client.config.root_dir
  vim.api.nvim_set_current_dir(project_root)
  change_tree_dir(project_root)
end

local get_lsp_client = function()
  -- Get lsp client for current buffer
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.buf_get_clients()
  if next(clients) == nil then
    return nil
  end

  for _, client in pairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes,buf_ft) ~= -1 then
      return client
    end
  end

  return nil
end

function _G.__lsp_root_dir()
  local client = get_lsp_client()
  if client ~= nil then
    set_project_dir(client)
  end
end

vim.cmd('autocmd BufEnter * call v:lua.__lsp_root_dir()')


local on_attach = function(client, bufnr)
  set_project_dir(client)
end

local _start_client = vim.lsp.start_client
vim.lsp.start_client = function(config)
  if config.on_attach == nil then
    config.on_attach = on_attach
  else
    local _on_attach = config.on_attach
    config.on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      _on_attach(client, bufnr)
    end
  end
  return _start_client(config)
end

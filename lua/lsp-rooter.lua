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


function _G.__lsp_root_dir()
  local buf_clients = vim.lsp.buf_get_clients()
  for _, client in ipairs(buf_clients) do
    set_project_dir(client)
  end
end

vim.cmd('autocmd BufEnter * call v:lua.__lsp_root_dir()')

-- TODO Add on_detach and remove autocmd above, after:
-- https://github.com/neovim/neovim/issues/14535

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

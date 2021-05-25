local config = require("lsp-rooter.config")
local util = require("lsp-rooter.util")
local M = {}

local change_tree_dir = function(dir)
  -- nvim-tree.lua
  if vim.fn.exists('g:loaded_tree') and vim.g.loaded_tree then
    require'nvim-tree.lib'.change_dir(dir)
  end
end

local set_project_dir = function(client)
  local project_root = client.config.root_dir
  if M.project_dir ~= project_root then
    M.project_dir = project_root
    vim.api.nvim_set_current_dir(project_root)
    change_tree_dir(project_root)
  end
end

local get_lsp_client = function()
  -- Get lsp client for current buffer
  local ignore_lsp = config.options.ignore_lsp
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.buf_get_clients()
  if next(clients) == nil then
    return nil
  end

  for _, client in pairs(clients) do
    if util.Set.contains(ignore_lsp, client.name) == false then
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes,buf_ft) ~= -1 then
        return client
      end
    end
  end

  return nil
end

-- autocmd BufEnter
function _G.__lsp_root_dir()
  if M.enabled then
    local client = get_lsp_client()
    if client ~= nil then
      set_project_dir(client)
    end
  end
end


---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
  -- TODO avoid code repetition in both attach and get client
  if M.enabled then
    local ignore_lsp = config.options.ignore_lsp
    if util.Set.contains(ignore_lsp, client.name) == false then
      set_project_dir(client)
    end
  end
end

local _start_client = vim.lsp.start_client
vim.lsp.start_client = function(lsp_config)
  if lsp_config.on_attach == nil then
    lsp_config.on_attach = on_attach
  else
    local _on_attach = lsp_config.on_attach
    lsp_config.on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      _on_attach(client, bufnr)
    end
  end
  return _start_client(lsp_config)
end

M.enabled = false
M.loaded = false
M.project_dir = nil

M.enable = function ()
  M.enabled = true
  if M.loaded == false then
    vim.cmd('autocmd BufEnter * call v:lua.__lsp_root_dir()')
    M.loaded = true
  end
end

M.disable = function ()
  M.enabled = false
end

return M

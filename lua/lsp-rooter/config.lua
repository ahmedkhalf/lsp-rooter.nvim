local util = require("lsp-rooter.util")
local M = {}

M.options = {}

local defaults = {
  -- manual_mode = false,
  ignore_lsp = {},
  -- on_fail = function ()
  -- end,
}

-- TODO options validation
M.setup = function (options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})

  -- Change table to set for faster indexing
  M.options.ignore_lsp = util.Set.new(M.options.ignore_lsp)
end

M.setup()

return M

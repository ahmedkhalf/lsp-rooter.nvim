local M = {}

M.options = {}

-- TODO validation
local defaults = {
  -- manual_mode = false,
  ignore_lsp = {},
  -- on_fail = function ()
  -- end,
}

M.setup = function (options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

M.setup()

return M

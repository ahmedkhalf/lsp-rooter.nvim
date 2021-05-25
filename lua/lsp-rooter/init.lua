local rooter = require("lsp-rooter.rooter")
local config = require("lsp-rooter.config")

local M = {}

M.setup = config.setup

M.enable = rooter.enable
M.enable() -- Enable plugin at startup

M.disable = rooter.disable

return M

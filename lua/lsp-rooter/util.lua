local M = {}

M.Set = {}

function M.Set.new (t)
  local set = {}
  for _, l in ipairs(t) do set[l] = true end
  return set
end

function M.Set.contains(set, key)
  return set[key] ~= nil
end

return M

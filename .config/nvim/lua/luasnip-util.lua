local M = {}

function M.get_visual(_, snip)
  local res, env = {}, snip.env
  for _, ele in ipairs(env.LS_SELECT_RAW) do table.insert(res, ele) end
  return res
end

return M

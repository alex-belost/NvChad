local api = require "nvim-tree.api"
local M = {}

M.edit_or_open = function()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    api.node.open.edit()
  else
    api.node.open.edit()
  end
end

M.vsplit_preview = function()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    api.node.open.edit()
  else
    api.node.open.vertical()
  end

  api.tree.focus()
end

M.smart_close_or_parent = function()
  local node = api.tree.get_node_under_cursor()

  if node.type == "directory" then
    if node.open then
      api.node.open.edit()
    else
      api.node.navigate.parent()
    end
  else
    api.node.navigate.parent()
  end
end

return M

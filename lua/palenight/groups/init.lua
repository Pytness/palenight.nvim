local M = {}

local function load_highlights(hl_table)
  for group, settings in pairs(hl_table) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

M.get_groups = function(colors)
  local groups = {}
  local highlights = require('palenight.groups.highlights').generate(colors)
  local treesitter = require('palenight.groups.treesitter').generate(colors)
  local leap = require('palenight.groups.leap').generate(colors)

  local function insert(tbl)
    for k, v in pairs(tbl) do
      groups[k] = v
    end
  end

  insert(highlights)
  insert(treesitter)
  insert(leap)

  return groups
end

M.load_groups = function()
  local colors = require 'palenight.colors'
  local groups = M.get_groups(colors)
  load_highlights(groups)
end

return M

local M = {}

local function load_highlights(hl_table)
  for group, settings in pairs(hl_table) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

M.load_groups = function()
  load_highlights(require 'palenight.groups.highlights')
  load_highlights(require 'palenight.groups.treesitter')
  load_highlights(require 'palenight.groups.leap')
end

return M

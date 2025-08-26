local groups = require 'palenight.groups'
local term = require 'palenight.term'

local M = {}

M.colorscheme = function()
  vim.api.nvim_command 'hi clear'
  if vim.fn.exists 'syntax_on' then
    vim.api.nvim_command 'syntax reset'
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'palenight'

  term.set_terminal_colors()
  groups.load_groups()
end

M.setup = function() end

return M

local colors = require 'palenight.colors'

return {
  gitcommitComment = { fg = colors.comment_grey },
  gitcommitUnmerged = { fg = colors.green },
  gitcommitOnBranch = {},
  gitcommitBranch = { fg = colors.purple },
  gitcommitDiscardedType = { fg = colors.red },
  gitcommitSelectedType = { fg = colors.green },
  gitcommitHeader = {},
  gitcommitUntrackedFile = { fg = colors.cyan },
  gitcommitDiscardedFile = { fg = colors.red },
  gitcommitSelectedFile = { fg = colors.green },
  gitcommitUnmergedFile = { fg = colors.yellow },
  gitcommitFile = {},
  gitcommitSummary = { fg = colors.white },
  gitcommitOverflow = { fg = colors.red },
}

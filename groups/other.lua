local colors = require 'palenight.colors'

return {
  dockerfileKeyword = { fg = colors.purple }, -- Dockerfile keywords
  shSet = { fg = colors.cyan }, -- Shell Set
  shSetOption = { fg = colors.white }, -- Shell Set Option
  shStatement = { fg = colors.cyan }, -- Shell Statement
  shFunctionKey = { fg = colors.purple }, -- Shell Function Key
  goDeclaration = { fg = colors.purple }, -- Go Declaration

  -- Plugin Highlighting
  SignifySignAdd = { fg = colors.green },
  SignifySignChange = { fg = colors.yellow },
  SignifySignDelete = { fg = colors.red },

  NeomakeWarningSign = { fg = colors.yellow },
  NeomakeErrorSign = { fg = colors.red },
  NeomakeInfoSign = { fg = colors.blue },

  diffAdded = { fg = colors.green },
  diffRemoved = { fg = colors.red },

  VistaBracket = { fg = colors.purple },
  VistaChildrenNr = { fg = colors.dark_yellow },
  VistaScope = { fg = colors.blue_purple },
  VistaTag = { fg = colors.purple },
  VistaPrefix = { fg = colors.blue_purple },
  VistaParenthesis = { fg = colors.purple },
  VistaColon = { fg = colors.cyan },
  VistaIcon = { fg = colors.cyan },
  VistaLineNr = { fg = colors.comment_grey },
  VistaArgs = { fg = colors.comment_grey },
  VistaKind = { fg = colors.comment_grey },
  VistaScopeKind = { fg = colors.yellow },

  debugBreakpoint = { fg = colors.blue_purple },
  debugPC = { bg = colors.blue_purple, fg = colors.black },

  jediFunction = { bg = colors.white_mask_3, fg = colors.white },
  jediFat = { bg = colors.white_mask_3, fg = colors.blue, bold = true, underline = true },
}

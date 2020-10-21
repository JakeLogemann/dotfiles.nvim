-- luacheck: Globals Color, c, Group, g, s
_G.vimrc.colors = _G.vimrc.colors or {}

require'colorbuddy'.setup{}

local Color = require('colorbuddy.init').Color
local colors = require('colorbuddy.init').colors
local groups = require('colorbuddy.init').groups
local Group = require('colorbuddy.init').Group
local styles = require('colorbuddy.init').styles

_G.vimrc.colors.reset = function()
  vim.o.termguicolors = true
  vim.g.colors_name = 'nightfly'
  vim.o.background  = 'dark'
  vim.cmd('colorscheme '.. vim.g.colors_name)

  -- Core theme colors
  Color.new('black',        '#011627')
  Color.new('black_2',      '#092236')
  Color.new('blue',         '#82aaff')
  Color.new('cyan',         '#21c7a8')
  Color.new('cyan_dark',    '#296596')
  Color.new('cyan_light',   '#7fdbca')
  Color.new('gray',         '#7c8f8f')
  Color.new('gray_2',       '#1d3b53')
  Color.new('gray_3',       '#0e293f')
  Color.new('gray_4',       '#2c3043')
  Color.new('gray_darkest', '#081e2f')
  Color.new('green',        '#a1cd5e')
  Color.new('magenta',      '#c792ea')
  Color.new('magenta_bold', '#ff5874')
  Color.new('orange',       '#f78c6c')
  Color.new('peach',        '#ffcb8b')
  Color.new('purple',       '#ae81ff')
  Color.new('purple_bold',  '#5e97ec')
  Color.new('purple_dark',  '#4b6479')
  Color.new('red',          '#fc514e')
  Color.new('tan',          '#ecc48d')
  Color.new('white',        '#c3ccdc')
  Color.new('white_bold',   '#d6deeb')
  Color.new('white_muted',  '#a1aab8')
  Color.new('yellow',       '#e3d18a')


  -- Common "contextual" color aliases
  colors.fg         = colors.white
  colors.bad        = colors.red
  colors.good       = colors.green
  colors.muted      = colors.gray_4
  colors.hidden     = colors.black_2
  colors.bg         = colors.black
  colors.background = colors.bg
  colors.foreground = colors.fg


  -- NeoVim Terminal Colors
  vim.g.terminal_color_0  = colors.gray_2:to_rgb()
  vim.g.terminal_color_1  = colors.red:to_rgb()
  vim.g.terminal_color_2  = colors.white_muted:to_rgb()
  vim.g.terminal_color_3  = colors.yellow:to_rgb()
  vim.g.terminal_color_4  = colors.blue:to_rgb()
  vim.g.terminal_color_5  = colors.magenta:to_rgb()
  vim.g.terminal_color_6  = colors.cyan_light:to_rgb()
  vim.g.terminal_color_7  = colors.green:to_rgb()
  vim.g.terminal_color_8  = colors.gray:to_rgb()
  vim.g.terminal_color_9  = colors.magenta_bold:to_rgb()
  vim.g.terminal_color_10 = colors.cyan:to_rgb()
  vim.g.terminal_color_11 = colors.tan:to_rgb()
  vim.g.terminal_color_12 = colors.blue:to_rgb()
  vim.g.terminal_color_13 = colors.purple:to_rgb()
  vim.g.terminal_color_14 = colors.cyan_light:to_rgb()
  vim.g.terminal_color_15 = colors.white_bold:to_rgb()

  -- core theme styles
  Group.new('Boolean',          colors.magenta_bold, colors.none, styles.none)
  Group.new('Character',        colors.purple, colors.none, styles.none)
  Group.new('Constant',         colors.orange, colors.none, styles.none)
  Group.new('Error',            colors.bad, colors.bg, styles.bold)
  Group.new('Comment',          colors.gray_4, colors.background, styles.italic)
  Group.new('Exception',        colors.magenta_bold, colors.none, styles.bold)
  Group.new('Function',         colors.blue, colors.none, styles.none)
  Group.new('Identifier',       colors.cyan_light, colors.none, styles.bold)
  Group.new('Normal',           colors.white, colors.black)
  Group.new('Operator',         colors.magenta_bold, colors.none, styles.none)
  Group.new('Question',         colors.green, colors.none)
  Group.new('Statement',        colors.magenta, colors.bg, styles.none)
  Group.new('String',           colors.tan, colors.none)
  Group.new('Structure',        colors.magenta, colors.bg)
  Group.new('Todo',             colors.yellow, colors.bg)
  Group.new('Special',          colors.magenta_bold, colors.bg, styles.none)
  Group.new('Type',             colors.cyan, colors.none, styles.none)
  Group.new('WarningMsg',       colors.orange, colors.bg)

  -- core vim styles
  Group.new('ColorColumn',      colors.gray_darkest, colors.bg)
  Group.new('Conceal',          groups.Comment)
  Group.new('Cursor',           colors.bg, colors.white_muted)
  Group.new('CursorColumn',     colors.none, colors.black_2)
  Group.new('CursorLine',       colors.none, colors.black_2)
  Group.new('CursorLineNr',     colors.blue, colors.black_2)
  Group.new('Delimiter',        groups.Comment)
  Group.new('ErrorMsg',         groups.Error)
  Group.new('FoldColumn',       colors.green, colors.gray_4)
  Group.new('Folded',           colors.green, colors.black_2)
  Group.new('Ignore',           colors.gray_3, colors.none, styles.underline)
  Group.new('IncSearch',        colors.peach, colors.bg, styles.none)
  Group.new('Label',            colors.cyan_light, colors.none, styles.none)
  Group.new('MatchParen',       colors.orange, colors.bg)
  Group.new('ModeMsg',          colors.white_muted, colors.none)
  Group.new('MoreMsg',          colors.red, colors.none)
  Group.new('NonText',          colors.orange, colors.none, styles.none)
  Group.new('Pmenu',            colors.white_muted, colors.bg)
  Group.new('PmenuSbar',        colors.fg, colors.gray_3)
  Group.new('PmenuSel',         colors.fg, colors.cyan_dark)
  Group.new('PmenuThumb',       colors.fg, colors.purple_dark)
  Group.new('PreProc',          colors.magenta_bold, colors.none, styles.none)
  Group.new('QuickFixLine',     colors.fg, colors.gray_3)
  Group.new('Repeat',           colors.magenta, colors.none, styles.none)
  Group.new('SignColumn',       colors.green, colors.bg)
  Group.new('SpecialKey',       colors.blue, colors.bg)
  Group.new('SpellBad',         colors.red, colors.none, styles.underline)
  Group.new('SpellCap',         colors.blue, colors.none, styles.underline)
  Group.new('SpellLocal',       colors.blue, colors.none, styles.underline)
  Group.new('SpellRare',        colors.yellow, colors.none, styles.underline)
  Group.new('StatusLine',       colors.white, colors.black_2, styles.none)
  Group.new('StatusLineNC',     colors.white_muted, colors.black_2, styles.none)
  Group.new('StatusLineTerm',   colors.white, colors.black_2, styles.none)
  Group.new('StatusLineTermNC', colors.white_muted, colors.black_2, styles.none)
  Group.new('StorageClass',     colors.orange, colors.none, styles.none)
  Group.new('Tabline',          colors.white_muted, colors.black_2, styles.none)
  Group.new('TablineFill',      colors.gray_4, colors.black_2, styles.none)
  Group.new('TablineSel',       colors.cyan_dark, colors.black_2, styles.none)
  Group.new('TermCursor',       colors.fg, colors.white_muted)
  Group.new('Title',            colors.orange, colors.none, styles.bold)
  Group.new('Search',           colors.orange, colors.bg, styles.none)
  Group.new('Underlined',       colors.none, colors.none, styles.underline)
  Group.new('VertSplit',        colors.gray_4, colors.gray_4, styles.none)
  Group.new('Visual',           colors.none, colors.gray_2, styles.none)
  Group.new('VisualInDiff',     colors.fg, colors.gray_2, styles.none)
  Group.new('VisualNOS',        colors.fg, colors.gray_2, styles.none)
  Group.new('Whitespace',       colors.gray_3, colors.none)
  Group.new('WildMenu',         colors.fg, colors.cyan_dark)
  Group.new('lCursor',          colors.bg, colors.white_muted)
  Group.new('User1',            colors.black_2, colors.blue)
  Group.new('User2',            colors.black_2, colors.white)
  Group.new('User3',            colors.black_2, colors.purple)
  Group.new('User4',            colors.black_2, colors.magenta_bold)
  Group.new('User5',            colors.gray_4, colors.blue)
  Group.new('User6',            colors.gray_4, colors.magenta_bold)
  Group.new('User7',            colors.gray_4, colors.blue)


  -- Neovim Treesitter
  Group.new('TSAnnotation',      groups.Label)
  Group.new('TSAttribute',       groups.Label)
  Group.new('TSConstBuiltin',    groups.Constant)
  Group.new('TSConstMacro',      groups.Constant)
  Group.new('TSConstant',        groups.Constant)
  Group.new('TSConstructor',     groups.Function)
  Group.new('TSError',           groups.Error)
  Group.new('TSFuncBuiltin',     groups.Function)
  Group.new('TSFuncMacro',       groups.Function)
  Group.new('TSInclude',         groups.Type)
  Group.new('TSKeywordOperator', groups.Operator)
  Group.new('TSNamespace',       groups.Title)
  Group.new('TSParameter',       groups.Identifier)
  Group.new('TSPunctSpecial',    groups.Delimiter)
  Group.new('TSTag',             groups.Type)
  Group.new('TSTagDelimiter',    groups.Delimiter)
  Group.new('TSVariableBuiltin', groups.Identifier)

  -- LUA
  Group.new('luafunctioncall', groups.Function)
  Group.new('luaBraces',       groups.MatchParen)
  Group.new('luabuiltin',      groups.Operator)
  Group.new('luakeyword',      groups.Operator)
  Group.new('luaSpecialTable', groups.Special)

  -- C/C++
  Group.new('cDefine', groups.Special)
  Group.new('cPreCondit', colors.magenta, colors.none, styles.none)
  Group.new('cStatement', groups.Statement)
  Group.new('cStructure', colors.orange, colors.none, styles.none)
  Group.new('cppAccess', colors.green, colors.none, styles.none)
  Group.new('cppCast', colors.cyan_light, colors.none, styles.none)
  Group.new('cppCustomClass', colors.cyan_light, colors.none, styles.none)
  Group.new('cppExceptions', colors.green, colors.none, styles.none)
  Group.new('cppModifier', colors.magenta, colors.none, styles.none)
  Group.new('cppOperator', groups.Operator)
  Group.new('cppSTLconstant', colors.purple_bold, colors.none, styles.none)
  Group.new('cppSTLnamespace', colors.purple_bold, colors.none, styles.none)
  Group.new('cppStatement', colors.cyan_light, colors.none, styles.none)

  -- C#
  Group.new('csModifier', colors.green, colors.none, styles.none)
  Group.new('csPrecondit', colors.magenta, colors.none, styles.none)
  Group.new('csXmlTag', colors.blue, colors.none, styles.none)

  -- Clojure
  Group.new('clojureDefine', colors.magenta, colors.none, styles.none)
  Group.new('clojureKeyword', colors.cyan_light, colors.none, styles.none)
  Group.new('clojureMacro', colors.orange, colors.none, styles.none)
  Group.new('clojureParen', colors.blue, colors.none, styles.none)
  Group.new('clojureSpecial', colors.magenta, colors.none, styles.none)

  -- CoffeeScript
  Group.new('coffeeConstant', colors.orange, colors.none, styles.none)
  Group.new('coffeeGlobal', colors.magenta_bold, colors.none, styles.none)
  Group.new('coffeeKeyword', colors.orange, colors.none, styles.none)
  Group.new('coffeeObject', colors.cyan, colors.none, styles.none)
  Group.new('coffeeObjAssign', colors.blue, colors.none, styles.none)
  Group.new('coffeeSpecialIdent', colors.cyan_light, colors.none, styles.none)
  Group.new('coffeeSpecialVar', colors.blue, colors.none, styles.none)
  Group.new('coffeeStatement', colors.orange, colors.none, styles.none)

  -- Crystal
  Group.new('crystalAccess', colors.yellow, colors.none, styles.none)
  Group.new('crystalAttribute', colors.blue, colors.none, styles.none)
  Group.new('crystalBlockParameter', colors.green, colors.none, styles.none)
  Group.new('crystalClass', colors.magenta, colors.none, styles.none)
  Group.new('crystalDefine', colors.magenta, colors.none, styles.none)
  Group.new('crystalExceptional', colors.orange, colors.none, styles.none)
  Group.new('crystalInstanceVariable', colors.cyan_light, colors.none, styles.none)
  Group.new('crystalModule', colors.blue, colors.none, styles.none)
  Group.new('crystalPseudoVariable', colors.green, colors.none, styles.none)
  Group.new('crystalSharpBang', colors.white_muted, colors.none, styles.none)
  Group.new('crystalStringDelimiter', colors.tan, colors.none, styles.none)

  -- CSS/SCSS
  Group.new('cssAttr', colors.cyan_light, colors.none, styles.none)
  Group.new('cssClassName', colors.blue, colors.none, styles.none)
  Group.new('cssColor', colors.cyan_light, colors.none, styles.none)
  Group.new('cssIdentifier', colors.peach, colors.none, styles.none)
  Group.new('cssProp', colors.cyan_light, colors.none, styles.none)
  Group.new('cssValueNumber', colors.magenta, colors.none, styles.none)
  Group.new('scssSelectorName', colors.blue, colors.none, styles.none)

  -- Dart
  Group.new('dartMetadata', colors.green, colors.none, styles.none)
  Group.new('dartStorageClass', colors.magenta, colors.none, styles.none)
  Group.new('dartTypedef', colors.magenta, colors.none, styles.none)
  Group.new('dartUserType', colors.blue, colors.none, styles.none)

  -- Elixir
  Group.new('eelixirDelimiter', colors.magenta_bold, colors.none, styles.none)
  Group.new('elixirAtom', colors.purple, colors.none, styles.none)
  Group.new('elixirBlockDefinition', colors.magenta, colors.none, styles.none)
  Group.new('elixirDefine', colors.magenta, colors.none, styles.none)
  Group.new('elixirDocTest', colors.white_muted, colors.none, styles.none)
  Group.new('elixirExUnitAssert', colors.green, colors.none, styles.none)
  Group.new('elixirExUnitMacro', colors.blue, colors.none, styles.none)
  Group.new('elixirKernelFunction', colors.green, colors.none, styles.none)
  Group.new('elixirKeyword', colors.orange, colors.none, styles.none)
  Group.new('elixirModuleDefine', colors.blue, colors.none, styles.none)
  Group.new('elixirPrivateDefine', colors.magenta, colors.none, styles.none)
  Group.new('elixirStringDelimiter', colors.tan, colors.none, styles.none)
  Group.new('elixirVariable', colors.cyan_light, colors.none, styles.none)

  -- Elm
  Group.new('elmLetBlockDefinition', colors.green, colors.none, styles.none)
  Group.new('elmTopLevelDecl', colors.orange, colors.none, styles.none)
  Group.new('elmType', groups.Type)

  -- Go
  Group.new('goBuiltins', colors.blue, colors.none, styles.none)
  Group.new('goConditional', colors.magenta, colors.none, styles.none)
  Group.new('goDeclType', colors.green, colors.none, styles.none)
  Group.new('goDirective', colors.magenta_bold, colors.none, styles.none)
  Group.new('goFloats', colors.orange, colors.none, styles.none)
  Group.new('goFunction', colors.blue, colors.none, styles.none)
  Group.new('goFunctionCall', colors.blue, colors.none, styles.none)
  Group.new('goImport', colors.magenta_bold, colors.none, styles.none)
  Group.new('goLabel', colors.yellow, colors.none, styles.none)
  Group.new('goMethod', colors.blue, colors.none, styles.none)
  Group.new('goMethodCall', colors.blue, colors.none, styles.none)
  Group.new('goPackage', colors.magenta, colors.none, styles.none)
  Group.new('goSignedInts', colors.cyan, colors.none, styles.none)
  Group.new('goStruct', colors.orange, colors.none, styles.none)
  Group.new('goStructDef', colors.orange, colors.none, styles.none)
  Group.new('goUnsignedInts', colors.orange, colors.none, styles.none)

  -- Haskell
  Group.new('haskellDecl', colors.orange, colors.none, styles.none)
  Group.new('haskellDeclKeyword', colors.orange, colors.none, styles.none)
  Group.new('haskellIdentifier', colors.cyan_light, colors.none, styles.none)
  Group.new('haskellLet', colors.blue, colors.none, styles.none)
  Group.new('haskellOperators', groups.Operator)
  Group.new('haskellType',  groups.Type)
  Group.new('haskellWhere', colors.magenta, colors.none, styles.none)

  -- HTML
  Group.new('htmlArg', colors.blue, colors.none, styles.none)
  Group.new('htmlLink', colors.green, colors.none, styles.none)
  Group.new('htmlEndTag', colors.purple, colors.none, styles.none)
  Group.new('htmlH1', colors.magenta_bold, colors.none, styles.none)
  Group.new('htmlH2', colors.orange, colors.none, styles.none)
  Group.new('htmlTag', colors.green, colors.none, styles.none)
  Group.new('htmlTagN', colors.blue, colors.none, styles.none)
  Group.new('htmlTagName', colors.blue, colors.none, styles.none)
  Group.new('htmlUnderline', colors.white, colors.none, styles.none)
  -- if g:nightflyItalics
  --     exec 'highlight htmlBoldItalic guibg=' . s:black . ' guifg=' . s:orange . ' gui=italic'
  --     exec 'highlight htmlBoldUnderlineItalic guibg=' . s:black . ' guifg=' . s:orange . ' gui=italic'
  --     exec 'highlight htmlItalic guifg=' . s:white_muted . ' gui=italic'
  --     exec 'highlight htmlUnderlineItalic guibg=' . s:black . ' guifg=' . s:white_muted . ' gui=italic'
  -- else
  --     exec 'highlight htmlBoldItalic guibg=' . s:black . ' guifg=' . s:orange
  --     exec 'highlight htmlBoldUnderlineItalic guibg=' . s:black . ' guifg=' . s:orange
  --     exec 'highlight htmlItalic guifg=' . s:white_muted ' gui=none'
  --     exec 'highlight htmlUnderlineItalic guibg=' . s:black . ' guifg=' . s:white_muted
  -- endif

  -- Java
  Group.new('javaAnnotation', colors.green, colors.none, styles.none)
  Group.new('javaBraces', colors.white, colors.none, styles.none)
  Group.new('javaClassDecl', colors.peach, colors.none, styles.none)
  Group.new('javaCommentTitle', colors.white_muted, colors.none, styles.none)
  Group.new('javaConstant', colors.blue, colors.none, styles.none)
  Group.new('javaDebug', colors.blue, colors.none, styles.none)
  Group.new('javaMethodDecl', colors.yellow, colors.none, styles.none)
  Group.new('javaOperator', groups.Operator)
  Group.new('javaScopeDecl', colors.magenta, colors.none, styles.none)
  Group.new('javaStatement', colors.cyan_light, colors.none, styles.none)

  -- JavaScript, 'pangloss/vim-javascript' plugin
  Group.new('jsClassDefinition', colors.cyan, colors.none, styles.none)
  Group.new('jsClassKeyword', colors.magenta, colors.none, styles.none)
  Group.new('jsClassMethodType', colors.cyan, colors.none, styles.none)
  Group.new('jsExceptions', colors.cyan, colors.none, styles.none)
  Group.new('jsFrom', colors.orange, colors.none, styles.none)
  Group.new('jsFuncBlock', colors.cyan_light, colors.none, styles.none)
  Group.new('jsFuncCall', colors.blue, colors.none, styles.none)
  Group.new('jsFunction', colors.magenta, colors.none, styles.none)
  Group.new('jsGlobalObjects', colors.green, colors.none, styles.none)
  Group.new('jsModuleAs', colors.orange, colors.none, styles.none)
  Group.new('jsObjectKey', colors.blue, colors.none, styles.none)
  Group.new('jsObjectValue', colors.cyan, colors.none, styles.none)
  Group.new('jsOperator', groups.Operator)
  Group.new('jsStorageClass', colors.green, colors.none, styles.none)
  Group.new('jsTemplateBraces', colors.magenta_bold, colors.none, styles.none)
  Group.new('jsTemplateExpression', colors.cyan_light, colors.none, styles.none)
  Group.new('jsThis', colors.cyan_light, colors.none, styles.none)

  -- JSX, 'MaxMEllon/vim-jsx-pretty' plugin
  Group.new('jsxAttrib', colors.green, colors.none, styles.none)
  Group.new('jsxClosePunct', colors.purple, colors.none, styles.none)
  Group.new('jsxComponentName', colors.blue, colors.none, styles.none)
  Group.new('jsxOpenPunct', groups.Operator)
  Group.new('jsxTagName', colors.blue, colors.none, styles.none)

  -- Lua
  Group.new('luaBraces', colors.magenta_bold, colors.none, styles.none)
  Group.new('luaBuiltin', colors.green, colors.none, styles.none)
  Group.new('luaFuncCall', colors.blue, colors.none, styles.none)
  Group.new('luaSpecialTable', colors.blue, colors.none, styles.none)

  -- Markdown, 'tpope/vim-markdown' plugin
  Group.new('markdownBold', colors.peach, colors.none, styles.none)
  Group.new('markdownCode', colors.tan, colors.none, styles.none)
  Group.new('markdownCodeDelimiter', colors.tan, colors.none, styles.none)
  Group.new('markdownError', NormalNC, colors.none, styles.none)
  Group.new('markdownH1', colors.orange, colors.none, styles.none)
  Group.new('markdownUrl', colors.purple, colors.none, styles.none)

  -- Markdown, 'plasticboy/vim-markdown' plugin
  Group.new('mkdDelimiter', colors.white, colors.none, styles.none)
  Group.new('mkdLineBreak', NormalNC, colors.none, styles.none)
  Group.new('mkdListItem', colors.blue, colors.none, styles.none)
  Group.new('mkdURL', colors.purple, colors.none, styles.none)

  -- PHP
  Group.new('phpClass', colors.cyan, colors.none, styles.none)
  Group.new('phpClasses', colors.purple_bold, colors.none, styles.none)
  Group.new('phpFunction', colors.blue, colors.none, styles.none)
  Group.new('phpParent', colors.none, colors.none, styles.none)
  Group.new('phpType', groups.Type)

  -- PureScript
  Group.new('purescriptClass', colors.peach, colors.none, styles.none)
  Group.new('purescriptModuleParams', colors.orange, colors.none, styles.none)

  -- Python
  Group.new('pythonBuiltin', colors.blue, colors.none, styles.none)
  Group.new('pythonClassVar', colors.green, colors.none, styles.none)
  Group.new('pythonCoding', colors.blue, colors.none, styles.none)
  Group.new('pythonImport', colors.magenta_bold, colors.none, styles.none)
  Group.new('pythonOperator', groups.Operator)
  Group.new('pythonRun', colors.blue, colors.none, styles.none)
  Group.new('pythonStatement', groups.Statement)

  -- Ruby
  Group.new('erubyDelimiter', colors.magenta_bold, colors.none, styles.none)
  Group.new('rubyAccess', colors.yellow, colors.none, styles.none)
  Group.new('rspecGroupMethods', colors.blue, colors.none, styles.none)
  Group.new('rubyAssertion', colors.blue, colors.none, styles.none)
  Group.new('rubyAttribute', colors.blue, colors.none, styles.none)
  Group.new('rubyBlockParameter', colors.green, colors.none, styles.none)
  Group.new('rubyCallback', colors.blue, colors.none, styles.none)
  Group.new('rubyClass', colors.orange, colors.none, styles.none)
  Group.new('rubyClassName', colors.cyan, colors.none, styles.none)
  Group.new('rubyDefine', colors.magenta, colors.none, styles.none)
  Group.new('rubyEntities', colors.blue, colors.none, styles.none)
  Group.new('rubyExceptional', colors.orange, colors.none, styles.none)
  Group.new('rubyGemfileMethod', colors.blue, colors.none, styles.none)
  Group.new('rubyInstanceVariable', colors.cyan_light, colors.none, styles.none)
  Group.new('rubyInterpolationDelimiter', colors.magenta_bold, colors.none, styles.none)
  Group.new('rubyMacro', colors.blue, colors.none, styles.none)
  Group.new('rubyModule', colors.blue, colors.none, styles.none)
  Group.new('rubyModuleName', colors.cyan, colors.none, styles.none)
  Group.new('rubyPseudoVariable', colors.green, colors.none, styles.none)
  Group.new('rubyResponse', colors.blue, colors.none, styles.none)
  Group.new('rubyRoute', colors.blue, colors.none, styles.none)
  Group.new('rubySharpBang', colors.white_muted, colors.none, styles.none)
  Group.new('rubyStringDelimiter', colors.tan, colors.none, styles.none)
  Group.new('rubySymbol', colors.purple, colors.none, styles.none)

  -- Rust
  Group.new('rustAssert', colors.green, colors.none, styles.none)
  Group.new('rustAttribute', colors.none, colors.none, styles.none)
  Group.new('rustCharacterInvalid', colors.magenta_bold, colors.none, styles.none)
  Group.new('rustCharacterInvalidUnicode', colors.magenta_bold, colors.none, styles.none)
  Group.new('rustCommentBlockDoc', colors.white_muted, colors.none, styles.none)
  Group.new('rustCommentBlockDocError', colors.white_muted, colors.none, styles.none)
  Group.new('rustCommentLineDoc', colors.white_muted, colors.none, styles.none)
  Group.new('rustCommentLineDocError', colors.white_muted, colors.none, styles.none)
  Group.new('rustConstant', colors.orange, colors.none, styles.none)
  Group.new('rustDerive', colors.green, colors.none, styles.none)
  Group.new('rustEscapeError', colors.magenta_bold, colors.none, styles.none)
  Group.new('rustFuncName', colors.blue, colors.none, styles.none)
  Group.new('rustIdentifier', colors.blue, colors.none, styles.none)
  Group.new('rustInvalidBareKeyword', colors.magenta_bold, colors.none, styles.none)
  Group.new('rustKeyword', colors.magenta, colors.none, styles.none)
  Group.new('rustLifetime', colors.magenta, colors.none, styles.none)
  Group.new('rustMacro', colors.green, colors.none, styles.none)
  Group.new('rustMacroVariable', colors.magenta, colors.none, styles.none)
  Group.new('rustModPath', colors.purple_bold, colors.none, styles.none)
  Group.new('rustObsoleteExternMod', colors.magenta_bold, colors.none, styles.none)
  Group.new('rustObsoleteStorage', colors.magenta_bold, colors.none, styles.none)
  Group.new('rustReservedKeyword', colors.magenta_bold, colors.none, styles.none)
  Group.new('rustSelf', colors.cyan_light, colors.none, styles.none)
  Group.new('rustSigil', colors.cyan_light, colors.none, styles.none)
  Group.new('rustStorage', colors.magenta, colors.none, styles.none)
  Group.new('rustStructure', groups.Structure)
  Group.new('rustTrait', groups.Type)
  Group.new('rustType', groups.Type)

  -- Shell scripts
  Group.new('shAlias', colors.cyan_light, colors.none, styles.none)
  Group.new('shCommandSub', colors.none, colors.none, styles.none)
  Group.new('shLoop', colors.magenta, colors.none, styles.none)
  Group.new('shSetList', colors.cyan_light, colors.none, styles.none)
  Group.new('shShellVariables', colors.green, colors.none, styles.none)
  Group.new('shStatement', colors.none, colors.none, styles.none)
  Group.new('shVariable', colors.cyan_light, colors.none, styles.none)

  -- TypeScript (leafgarland/typescript-vim)
  Group.new('typescriptDOMObjects', colors.blue, colors.none, styles.none)
  Group.new('typescriptFuncComma', colors.white, colors.none, styles.none)
  Group.new('typescriptFuncKeyword', colors.green, colors.none, styles.none)
  Group.new('typescriptGlobalObjects', colors.blue, colors.none, styles.none)
  Group.new('typescriptIdentifier', colors.green, colors.none, styles.none)
  Group.new('typescriptNull', colors.green, colors.none, styles.none)
  Group.new('typescriptOpSymbols', groups.Operator)
  Group.new('typescriptOperator', groups.Operator)
  Group.new('typescriptParens', colors.white, colors.none, styles.none)
  Group.new('typescriptReserved', colors.magenta, colors.none, styles.none)
  Group.new('typescriptStorageClass', colors.green, colors.none, styles.none)

  -- TypeScript (HerringtonDarkholme/yats.vim)
  Group.new('typeScriptModule', colors.blue, colors.none, styles.none)
  Group.new('typescriptAbstract', colors.orange, colors.none, styles.none)
  Group.new('typescriptArrayMethod', colors.blue, colors.none, styles.none)
  Group.new('typescriptArrowFuncArg', colors.white, colors.none, styles.none)
  Group.new('typescriptBOM', colors.cyan, colors.none, styles.none)
  Group.new('typescriptBOMHistoryMethod', colors.blue, colors.none, styles.none)
  Group.new('typescriptBOMLocationMethod', colors.blue, colors.none, styles.none)
  Group.new('typescriptBOMWindowProp', colors.green, colors.none, styles.none)
  Group.new('typescriptBraces', colors.white, colors.none, styles.none)
  Group.new('typescriptCall', colors.white, colors.none, styles.none)
  Group.new('typescriptClassHeritage', colors.peach, colors.none, styles.none)
  Group.new('typescriptClassKeyword', colors.magenta, colors.none, styles.none)
  Group.new('typescriptClassName', colors.cyan, colors.none, styles.none)
  Group.new('typescriptDecorator', colors.green, colors.none, styles.none)
  Group.new('typescriptDOMDocMethod', colors.blue, colors.none, styles.none)
  Group.new('typescriptDOMEventTargetMethod', colors.blue, colors.none, styles.none)
  Group.new('typescriptDOMNodeMethod', colors.blue, colors.none, styles.none)
  Group.new('typescriptExceptions', colors.magenta_bold, colors.none, styles.none)
  Group.new('typescriptFuncType', colors.white, colors.none, styles.none)
  Group.new('typescriptMathStaticMethod', colors.blue, colors.none, styles.none)
  Group.new('typescriptMethodAccessor', colors.magenta, colors.none, styles.none)
  Group.new('typescriptObjectLabel', colors.blue, colors.none, styles.none)
  Group.new('typescriptParamImpl', colors.white, colors.none, styles.none)
  Group.new('typescriptStringMethod', colors.blue, colors.none, styles.none)
  Group.new('typescriptTry', colors.magenta_bold, colors.none, styles.none)
  Group.new('typescriptVariable', colors.green, colors.none, styles.none)
  Group.new('typescriptXHRMethod', colors.blue, colors.none, styles.none)

  -- Vimscript
  Group.new('vimBracket', colors.blue, colors.none, styles.none)
  Group.new('vimCommand', colors.orange, colors.none, styles.none)
  Group.new('vimCommentTitle', colors.magenta, colors.none, styles.none)
  Group.new('vimEnvvar', colors.magenta_bold, colors.none, styles.none)
  Group.new('vimFuncName', colors.blue, colors.none, styles.none)
  Group.new('vimFuncSID', colors.blue, colors.none, styles.none)
  Group.new('vimFunction', colors.blue, colors.none, styles.none)
  Group.new('vimNotation', colors.blue, colors.none, styles.none)
  Group.new('vimOption', colors.cyan_light, colors.none, styles.none)
  Group.new('vimParenSep', colors.white, colors.none, styles.none)
  Group.new('vimSep', colors.white, colors.none, styles.none)
  Group.new('vimUserFunc', colors.blue, colors.none, styles.none)

  -- XML
  Group.new('xmlAttrib', colors.green, colors.none, styles.none)
  Group.new('xmlEndTag', colors.blue, colors.none, styles.none)
  Group.new('xmlTag', colors.green, colors.none, styles.none)
  Group.new('xmlTagName', colors.blue, colors.none, styles.none)

  -- Git commits
  Group.new('gitCommitBranch', colors.blue, colors.none, styles.none)
  Group.new('gitCommitDiscardedFile', colors.magenta_bold, colors.none, styles.none)
  Group.new('gitCommitDiscardedType', colors.blue, colors.none, styles.none)
  Group.new('gitCommitHeader', colors.purple, colors.none, styles.none)
  Group.new('gitCommitSelectedFile', colors.cyan, colors.none, styles.none)
  Group.new('gitCommitSelectedType', colors.blue, colors.none, styles.none)
  Group.new('gitCommitUntrackedFile', colors.magenta_bold, colors.none, styles.none)
  Group.new('gitEmail', colors.blue, colors.none, styles.none)

  -- Git commit diffs
  Group.new('diffAdded', colors.green, colors.none, styles.none)
  Group.new('diffChanged', colors.magenta_bold, colors.none, styles.none)
  Group.new('diffIndexLine', colors.magenta_bold, colors.none, styles.none)
  Group.new('diffLine', colors.blue, colors.none, styles.none)
  Group.new('diffRemoved', colors.red, colors.none, styles.none)
  Group.new('diffSubname', colors.blue, colors.none, styles.none)

  -- Tagbar plugin
  Group.new('TagbarFoldIcon', colors.white_muted, colors.none, styles.none)
  Group.new('TagbarVisibilityPublic', colors.green, colors.none, styles.none)
  Group.new('TagbarVisibilityProtected', colors.green, colors.none, styles.none)
  Group.new('TagbarVisibilityPrivate', colors.green, colors.none, styles.none)
  Group.new('TagbarKind', colors.cyan, colors.none, styles.none)

  -- NERDTree plugin
  Group.new('NERDTreeClosable', colors.green, colors.none, styles.none)
  Group.new('NERDTreeCWD', colors.purple, colors.none, styles.none)
  Group.new('NERDTreeDir', colors.blue, colors.none, styles.none)
  Group.new('NERDTreeDirSlash', colors.magenta_bold, colors.none, styles.none)
  Group.new('NERDTreeExecFile', colors.tan, colors.none, styles.none)
  Group.new('NERDTreeFile', colors.white, colors.none, styles.none)
  Group.new('NERDTreeFlags', colors.purple, colors.none, styles.none)
  Group.new('NERDTreeHelp', colors.white_muted, colors.none, styles.none)
  Group.new('NERDTreeLinkDir', colors.blue, colors.none, styles.none)
  Group.new('NERDTreeLinkFile', colors.blue, colors.none, styles.none)
  Group.new('NERDTreeLinkTarget', colors.cyan_light, colors.none, styles.none)
  Group.new('NERDTreeOpenable', colors.green, colors.none, styles.none)
  Group.new('NERDTreePart', colors.gray_2, colors.none, styles.none)
  Group.new('NERDTreePartFile', colors.gray_2, colors.none, styles.none)
  Group.new('NERDTreeUp', colors.blue, colors.none, styles.none)

  -- NERDTree Git plugin
  Group.new('NERDTreeGitStatusDirDirty', colors.tan, colors.none, styles.none)
  Group.new('NERDTreeGitStatusModified', colors.magenta_bold, colors.none, styles.none)
  Group.new('NERDTreeGitStatusRenamed', colors.blue, colors.none, styles.none)
  Group.new('NERDTreeGitStatusStaged', colors.blue, colors.none, styles.none)
  Group.new('NERDTreeGitStatusUntracked', colors.red, colors.none, styles.none)

  -- vimfiler plugin
  Group.new('vimfilerClosedFile', colors.blue, colors.none, styles.none)
  Group.new('vimfilerMarkedFile', colors.orange, colors.none, styles.none)
  Group.new('vimfilerNonMark', colors.green, colors.none, styles.none)
  Group.new('vimfilerNormalFile', colors.white, colors.none, styles.none)
  Group.new('vimfilerOpenedFile', colors.blue, colors.none, styles.none)
  Group.new('vimfilerROFile', colors.gray, colors.none, styles.none)

  -- fern.vim plugin
  Group.new('FernBranchSymbol', colors.green, colors.none, styles.none)
  Group.new('FernBranchText', colors.blue, colors.none, styles.none)
  Group.new('FernMarkedLine', colors.orange, colors.none, styles.none)
  Group.new('FernMarkedText', colors.orange, colors.none, styles.none)
  Group.new('FernRootSymbol', colors.purple, colors.none, styles.none)
  Group.new('FernRootText', colors.purple, colors.none, styles.none)

  -- fern-git-status.vim plugin
  Group.new('FernGitStatusBracket', colors.gray, colors.none, styles.none)
  Group.new('FernGitStatusIndex', colors.cyan, colors.none, styles.none)
  Group.new('FernGitStatusWorktree', colors.magenta_bold, colors.none, styles.none)

  -- Misc languages and plugins
  Group.new('bufExplorerHelp', colors.white_muted, colors.none, styles.none)
  Group.new('bufExplorerSortBy', colors.white_muted, colors.none, styles.none)
  Group.new('CleverFDefaultLabel', colors.magenta_bold, colors.none, styles.none)
  Group.new('CtrlPMatch', colors.orange, colors.none, styles.none)
  Group.new('Directory', colors.cyan, colors.none, styles.none)
  Group.new('HighlightedyankRegion', colors.gray_2, colors.none, styles.none)
  Group.new('jsonKeyword', colors.blue, colors.none, styles.none)
  Group.new('jsonBoolean', colors.cyan_light, colors.none, styles.none)
  Group.new('jsonQuote', colors.white, colors.none, styles.none)
  Group.new('netrwClassify', colors.magenta_bold, colors.none, styles.none)
  Group.new('netrwDir', colors.blue, colors.none, styles.none)
  Group.new('netrwExe', colors.tan, colors.none, styles.none)
  Group.new('tagName', colors.cyan_light, colors.none, styles.none)
  Group.new('Cheat40Header', colors.blue, colors.none, styles.none)
  Group.new('Beacon', colors.white, colors.none, styles.none)

  -- LuaTree
  Group.new('LuaTreeFolderName', groups.Constant)
  Group.new('LuaTreeFolderIcon', groups.Function)
  Group.new('LuaTreeMarkdownFile', groups.Operator)
  print("vimrc colors reset!")
end

_G.vimrc.colors.reset()

-- Colorizer
require 'colorizer'.setup({ 
  'css'; 'javascript'; 'lua'; 'html';
}, { 
  names = false; -- dont parse names like 'blue'
  mode = 'background' 
})

-- luacheck: Globals Color, c, Group, g, s
require'colorbuddy'.setup{}
local Color = require('colorbuddy.init').Color
local colors = require('colorbuddy.init').colors
local groups = require('colorbuddy.init').groups
local Group = require('colorbuddy.init').Group
local styles = require('colorbuddy.init').styles

vim.o.termguicolors = true
vim.g.colors_name = 'nightfly'
vim.o.background  = 'dark'
--``vim.cmd('colorscheme '.. vim.g.colors_name)

-- Core theme colors
Color.new('black',         '#011627')
Color.new('blue',          '#82aaff')
Color.new('blue_black',    '#081e2f')
Color.new('blue_cyan',     '#296596')
Color.new('blue_dark',     '#092236')
Color.new('blue_darker',     '#1d3b53')
Color.new('blue_deep',     '#0e293f')
Color.new('blue_grey',     '#7c8f8f')
Color.new('blue_light',    '#a1aab8')
Color.new('blue_slate',    '#2c3043')
Color.new('blue_steel',    '#4b6479')
Color.new('blue_white',    '#d6deeb')
Color.new('cyan_dark',     '#7fdbca')
Color.new('green',         '#a1cd5e')
Color.new('green_dark',    '#21c7a8')
Color.new('orange',        '#f78c6c')
Color.new('peach',         '#ffcb8b')
Color.new('purple',        '#ae81ff')
Color.new('purple_dark',   '#5e97ec')
Color.new('purple_violet', '#c792ea')
Color.new('red',           '#fc514e')
Color.new('tan',           '#ecc48d')
Color.new('watermelon',    '#ff5874')
Color.new('white',         '#c3ccdc')
Color.new('yellow',        '#e3d18a')


-- Common "contextual" color aliases
colors.fg         = colors.white
colors.bad        = colors.red
colors.good       = colors.green
colors.muted      = colors.blue_slate
colors.hidden     = colors.blue_dark
colors.bg         = colors.black
colors.background = colors.bg
colors.foreground = colors.fg


-- NeoVim Terminal Colors
vim.g.terminal_color_0  = colors.blue_darker:to_rgb()
vim.g.terminal_color_1  = colors.red:to_rgb()
vim.g.terminal_color_2  = colors.blue_light:to_rgb()
vim.g.terminal_color_3  = colors.yellow:to_rgb()
vim.g.terminal_color_4  = colors.blue:to_rgb()
vim.g.terminal_color_5  = colors.purple_violet:to_rgb()
vim.g.terminal_color_6  = colors.cyan_dark:to_rgb()
vim.g.terminal_color_7  = colors.green:to_rgb()
vim.g.terminal_color_8  = colors.blue_grey:to_rgb()
vim.g.terminal_color_9  = colors.watermelon:to_rgb()
vim.g.terminal_color_10 = colors.green_dark:to_rgb()
vim.g.terminal_color_11 = colors.tan:to_rgb()
vim.g.terminal_color_12 = colors.blue:to_rgb()
vim.g.terminal_color_13 = colors.purple:to_rgb()
vim.g.terminal_color_14 = colors.cyan_dark:to_rgb()
vim.g.terminal_color_15 = colors.blue_white:to_rgb()


-- core vim styles
Group.new('Boolean',          colors.watermelon, colors.none, styles.none)
Group.new('Character',        colors.purple, colors.none, styles.none)
Group.new('ColorColumn',      colors.blue_black, colors.bg)
Group.new('Comment',          colors.blue_slate, colors.bg, styles.italic)
Group.new('Conceal',          colors.blue_deep, colors.bg)
Group.new('Constant',         colors.orange, colors.none, styles.none)
Group.new('Cursor',           colors.bg, colors.blue_light)
Group.new('CursorColumn',     colors.none, colors.blue_dark)
Group.new('CursorLine',       colors.none, colors.blue_dark)
Group.new('CursorLineNr',     colors.blue, colors.blue_dark)
Group.new('Delimiter',        colors.white, colors.none)
Group.new('Error',            colors.bad, colors.bg, styles.bold)
Group.new('ErrorMsg',         colors.bad, colors.bg, styles.bold)
Group.new('Exception',        colors.watermelon, colors.none, styles.none)
Group.new('FoldColumn',       colors.green, colors.blue_slate)
Group.new('Folded',           colors.green, colors.blue_dark)
Group.new('Function',         colors.blue, colors.none, styles.none)
Group.new('Identifier',       colors.cyan_dark, colors.none, styles.none)
Group.new('Ignore',           colors.blue_deep, colors.none, styles.underline)
Group.new('IncSearch',        colors.peach, colors.bg, styles.none)
Group.new('Label',            colors.cyan_dark, colors.none, styles.none)
Group.new('MatchParen',       colors.orange, colors.bg)
Group.new('ModeMsg',          colors.blue_light, colors.none)
Group.new('MoreMsg',          colors.red, colors.none)
Group.new('NonText',          colors.orange, colors.none, styles.none)
Group.new('Normal',           colors.fg, colors.bg)
Group.new('Operator',         colors.watermelon, colors.none, styles.none)
Group.new('Pmenu',            colors.blue_light, colors.bg)
Group.new('PmenuSbar',        colors.fg, colors.blue_deep)
Group.new('PmenuSel',         colors.fg, colors.blue_cyan)
Group.new('PmenuThumb',       colors.fg, colors.blue_steel)
Group.new('PreProc',          colors.watermelon, colors.none, styles.none)
Group.new('Question',         colors.green, colors.none)
Group.new('QuickFixLine',     colors.fg, colors.blue_deep)
Group.new('Repeat',           colors.purple_violet, colors.none, styles.none)
Group.new('Search',           colors.orange, colors.bg, styles.none)
Group.new('SignColumn',       colors.green, colors.bg)
Group.new('Special',          colors.watermelon, colors.bg, styles.none)
Group.new('SpecialKey',       colors.blue, colors.bg)
Group.new('SpellBad',         colors.red, colors.none, styles.underline)
Group.new('SpellCap',         colors.blue, colors.none, styles.underline)
Group.new('SpellLocal',       colors.blue, colors.none, styles.underline)
Group.new('SpellRare',        colors.yellow, colors.none, styles.underline)
Group.new('Statement',        colors.purple_violet, colors.bg, styles.none)
Group.new('StatusLine',       colors.white, colors.blue_slate, styles.none)
Group.new('StatusLineNC',     colors.blue_light, colors.blue_slate, styles.none)
Group.new('StatusLineTerm',   colors.white, colors.blue_slate, styles.none)
Group.new('StatusLineTermNC', colors.blue_light, colors.blue_slate, styles.none)
Group.new('StorageClass',     colors.orange, colors.none, styles.none)
Group.new('String',           colors.tan, colors.none)
Group.new('Structure',        colors.purple_violet, colors.bg)
Group.new('Tabline',          colors.blue_light, colors.blue_slate, styles.none)
Group.new('TablineFill',      colors.blue_slate, colors.blue_slate, styles.none)
Group.new('TablineSel',       colors.blue, colors.blue_slate, styles.none)
Group.new('TermCursor',       colors.fg, colors.blue_light)
Group.new('Title',            colors.orange, colors.none, styles.bold)
Group.new('Todo',             colors.yellow, colors.bg)
Group.new('Type',             colors.green_dark, colors.none, styles.none)
Group.new('Underlined',       colors.green, colors.none, styles.underline)
Group.new('VertSplit',        colors.blue_slate, colors.blue_slate, styles.none)
Group.new('Visual',           colors.none, colors.blue_darker, styles.none)
Group.new('VisualInDiff',     colors.fg, colors.blue_darker, styles.none)
Group.new('VisualNOS',        colors.fg, colors.blue_darker, styles.none)
Group.new('WarningMsg',       colors.orange, colors.bg)
Group.new('Whitespace',       colors.blue_deep, colors.none)
Group.new('WildMenu',         colors.fg, colors.blue_cyan)
Group.new('lCursor',          colors.bg, colors.blue_light)
Group.new('User1',            colors.blue_dark, colors.blue)
Group.new('User2',            colors.blue_dark, colors.white)
Group.new('User3',            colors.blue_dark, colors.purple)
Group.new('User4',            colors.blue_dark, colors.watermelon)
Group.new('User5',            colors.blue_slate, colors.blue)
Group.new('User6',            colors.blue_slate, colors.watermelon)
Group.new('User7',            colors.blue_slate, colors.blue)


-- Neovim Treesitter
groups.TSConstant   = groups.Constant
groups.TSConstMacro   = groups.Constant
groups.TSConstBuiltin = groups.Constant
groups.TSError = groups.Error
groups.TSFuncBuiltin = groups.Function
groups.TSKeywordOperator = groups.Operator
groups.TSFuncMacro = groups.Function
Group.new('TSAnnotation', colors.purple_violet, colors.none)
Group.new('TSAttribute', colors.blue, colors.none)
Group.new('TSConstant', colors.purple, colors.none)
Group.new('TSConstBuiltin', colors.green, colors.none)
Group.new('TSConstructor', colors.green_dark, colors.none)
Group.new('TSError', groups.Error)
Group.new('TSInclude', colors.watermelon, colors.none)
Group.new('TSNamespace', colors.purple_violet, colors.none)
Group.new('TSParameter', colors.white, colors.none)
Group.new('TSPunctSpecial', colors.watermelon, colors.none)
Group.new('TSTag', colors.blue, colors.none)
Group.new('TSTagDelimiter', colors.green, colors.none)
Group.new('TSVariableBuiltin', colors.green, colors.none)

-- LUA
Group.new('luaFuncCall', colors.blue, colors.none)
Group.new('luaBraces', colors.watermelon, colors.none)
Group.new('luaBuiltin', colors.green, colors.none)
Group.new('luaSpecialTable', colors.blue, colors.none)

-- C/C++
Group.new('cDefine', colors.purple_violet, colors.none, styles.none)
Group.new('cPreCondit', colors.purple_violet, colors.none, styles.none)
Group.new('cStatement', colors.purple_violet, colors.none, styles.none)
Group.new('cStructure', colors.orange, colors.none, styles.none)
Group.new('cppAccess', colors.green, colors.none, styles.none)
Group.new('cppCast', colors.cyan_dark, colors.none, styles.none)
Group.new('cppCustomClass', colors.cyan_dark, colors.none, styles.none)
Group.new('cppExceptions', colors.green, colors.none, styles.none)
Group.new('cppModifier', colors.purple_violet, colors.none, styles.none)
Group.new('cppOperator', colors.green, colors.none, styles.none)
Group.new('cppSTLconstant', colors.purple_dark, colors.none, styles.none)
Group.new('cppSTLnamespace', colors.purple_dark, colors.none, styles.none)
Group.new('cppStatement', colors.cyan_dark, colors.none, styles.none)

-- C#
Group.new('csModifier', colors.green, colors.none, styles.none)
Group.new('csPrecondit', colors.purple_violet, colors.none, styles.none)
Group.new('csXmlTag', colors.blue, colors.none, styles.none)

-- Clojure
Group.new('clojureDefine', colors.purple_violet, colors.none, styles.none)
Group.new('clojureKeyword', colors.cyan_dark, colors.none, styles.none)
Group.new('clojureMacro', colors.orange, colors.none, styles.none)
Group.new('clojureParen', colors.blue, colors.none, styles.none)
Group.new('clojureSpecial', colors.purple_violet, colors.none, styles.none)

-- CoffeeScript
Group.new('coffeeConstant', colors.orange, colors.none, styles.none)
Group.new('coffeeGlobal', colors.watermelon, colors.none, styles.none)
Group.new('coffeeKeyword', colors.orange, colors.none, styles.none)
Group.new('coffeeObject', colors.green_dark, colors.none, styles.none)
Group.new('coffeeObjAssign', colors.blue, colors.none, styles.none)
Group.new('coffeeSpecialIdent', colors.cyan_dark, colors.none, styles.none)
Group.new('coffeeSpecialVar', colors.blue, colors.none, styles.none)
Group.new('coffeeStatement', colors.orange, colors.none, styles.none)

-- Crystal
Group.new('crystalAccess', colors.yellow, colors.none, styles.none)
Group.new('crystalAttribute', colors.blue, colors.none, styles.none)
Group.new('crystalBlockParameter', colors.green, colors.none, styles.none)
Group.new('crystalClass', colors.purple_violet, colors.none, styles.none)
Group.new('crystalDefine', colors.purple_violet, colors.none, styles.none)
Group.new('crystalExceptional', colors.orange, colors.none, styles.none)
Group.new('crystalInstanceVariable', colors.cyan_dark, colors.none, styles.none)
Group.new('crystalModule', colors.blue, colors.none, styles.none)
Group.new('crystalPseudoVariable', colors.green, colors.none, styles.none)
Group.new('crystalSharpBang', colors.blue_light, colors.none, styles.none)
Group.new('crystalStringDelimiter', colors.tan, colors.none, styles.none)

-- CSS/SCSS
Group.new('cssAttr', colors.cyan_dark, colors.none, styles.none)
Group.new('cssClassName', colors.blue, colors.none, styles.none)
Group.new('cssColor', colors.cyan_dark, colors.none, styles.none)
Group.new('cssIdentifier', colors.peach, colors.none, styles.none)
Group.new('cssProp', colors.cyan_dark, colors.none, styles.none)
Group.new('cssValueNumber', colors.purple_violet, colors.none, styles.none)
Group.new('scssSelectorName', colors.blue, colors.none, styles.none)

-- Dart
Group.new('dartMetadata', colors.green, colors.none, styles.none)
Group.new('dartStorageClass', colors.purple_violet, colors.none, styles.none)
Group.new('dartTypedef', colors.purple_violet, colors.none, styles.none)
Group.new('dartUserType', colors.blue, colors.none, styles.none)

-- Elixir
Group.new('eelixirDelimiter', colors.watermelon, colors.none, styles.none)
Group.new('elixirAtom', colors.purple, colors.none, styles.none)
Group.new('elixirBlockDefinition', colors.purple_violet, colors.none, styles.none)
Group.new('elixirDefine', colors.purple_violet, colors.none, styles.none)
Group.new('elixirDocTest', colors.blue_light, colors.none, styles.none)
Group.new('elixirExUnitAssert', colors.green, colors.none, styles.none)
Group.new('elixirExUnitMacro', colors.blue, colors.none, styles.none)
Group.new('elixirKernelFunction', colors.green, colors.none, styles.none)
Group.new('elixirKeyword', colors.orange, colors.none, styles.none)
Group.new('elixirModuleDefine', colors.blue, colors.none, styles.none)
Group.new('elixirPrivateDefine', colors.purple_violet, colors.none, styles.none)
Group.new('elixirStringDelimiter', colors.tan, colors.none, styles.none)
Group.new('elixirVariable', colors.cyan_dark, colors.none, styles.none)

-- Elm
Group.new('elmLetBlockDefinition', colors.green, colors.none, styles.none)
Group.new('elmTopLevelDecl', colors.orange, colors.none, styles.none)
Group.new('elmType', colors.blue, colors.none, styles.none)

-- Go
Group.new('goBuiltins', colors.blue, colors.none, styles.none)
Group.new('goConditional', colors.purple_violet, colors.none, styles.none)
Group.new('goDeclType', colors.green, colors.none, styles.none)
Group.new('goDirective', colors.watermelon, colors.none, styles.none)
Group.new('goFloats', colors.orange, colors.none, styles.none)
Group.new('goFunction', colors.blue, colors.none, styles.none)
Group.new('goFunctionCall', colors.blue, colors.none, styles.none)
Group.new('goImport', colors.watermelon, colors.none, styles.none)
Group.new('goLabel', colors.yellow, colors.none, styles.none)
Group.new('goMethod', colors.blue, colors.none, styles.none)
Group.new('goMethodCall', colors.blue, colors.none, styles.none)
Group.new('goPackage', colors.purple_violet, colors.none, styles.none)
Group.new('goSignedInts', colors.green_dark, colors.none, styles.none)
Group.new('goStruct', colors.orange, colors.none, styles.none)
Group.new('goStructDef', colors.orange, colors.none, styles.none)
Group.new('goUnsignedInts', colors.orange, colors.none, styles.none)

-- Haskell
Group.new('haskellDecl', colors.orange, colors.none, styles.none)
Group.new('haskellDeclKeyword', colors.orange, colors.none, styles.none)
Group.new('haskellIdentifier', colors.cyan_dark, colors.none, styles.none)
Group.new('haskellLet', colors.blue, colors.none, styles.none)
Group.new('haskellOperators', colors.watermelon, colors.none, styles.none)
Group.new('haskellType', colors.blue, colors.none, styles.none)
Group.new('haskellWhere', colors.purple_violet, colors.none, styles.none)

-- HTML
Group.new('htmlArg', colors.blue, colors.none, styles.none)
Group.new('htmlLink', colors.green, colors.none, styles.none)
Group.new('htmlEndTag', colors.purple, colors.none, styles.none)
Group.new('htmlH1', colors.watermelon, colors.none, styles.none)
Group.new('htmlH2', colors.orange, colors.none, styles.none)
Group.new('htmlTag', colors.green, colors.none, styles.none)
Group.new('htmlTagN', colors.blue, colors.none, styles.none)
Group.new('htmlTagName', colors.blue, colors.none, styles.none)
Group.new('htmlUnderline', colors.white, colors.none, styles.none)
-- if g:nightflyItalics
--     exec 'highlight htmlBoldItalic guibg=' . s:black . ' guifg=' . s:orange . ' gui=italic'
--     exec 'highlight htmlBoldUnderlineItalic guibg=' . s:black . ' guifg=' . s:orange . ' gui=italic'
--     exec 'highlight htmlItalic guifg=' . s:blue_light . ' gui=italic'
--     exec 'highlight htmlUnderlineItalic guibg=' . s:black . ' guifg=' . s:blue_light . ' gui=italic'
-- else
--     exec 'highlight htmlBoldItalic guibg=' . s:black . ' guifg=' . s:orange
--     exec 'highlight htmlBoldUnderlineItalic guibg=' . s:black . ' guifg=' . s:orange
--     exec 'highlight htmlItalic guifg=' . s:blue_light ' gui=none'
--     exec 'highlight htmlUnderlineItalic guibg=' . s:black . ' guifg=' . s:blue_light
-- endif

-- Java
Group.new('javaAnnotation', colors.green, colors.none, styles.none)
Group.new('javaBraces', colors.white, colors.none, styles.none)
Group.new('javaClassDecl', colors.peach, colors.none, styles.none)
Group.new('javaCommentTitle', colors.blue_light, colors.none, styles.none)
Group.new('javaConstant', colors.blue, colors.none, styles.none)
Group.new('javaDebug', colors.blue, colors.none, styles.none)
Group.new('javaMethodDecl', colors.yellow, colors.none, styles.none)
Group.new('javaOperator', colors.watermelon, colors.none, styles.none)
Group.new('javaScopeDecl', colors.purple_violet, colors.none, styles.none)
Group.new('javaStatement', colors.cyan_dark, colors.none, styles.none)

-- JavaScript, 'pangloss/vim-javascript' plugin
Group.new('jsClassDefinition', colors.green_dark, colors.none, styles.none)
Group.new('jsClassKeyword', colors.purple_violet, colors.none, styles.none)
Group.new('jsClassMethodType', colors.green_dark, colors.none, styles.none)
Group.new('jsExceptions', colors.green_dark, colors.none, styles.none)
Group.new('jsFrom', colors.orange, colors.none, styles.none)
Group.new('jsFuncBlock', colors.cyan_dark, colors.none, styles.none)
Group.new('jsFuncCall', colors.blue, colors.none, styles.none)
Group.new('jsFunction', colors.purple_violet, colors.none, styles.none)
Group.new('jsGlobalObjects', colors.green, colors.none, styles.none)
Group.new('jsModuleAs', colors.orange, colors.none, styles.none)
Group.new('jsObjectKey', colors.blue, colors.none, styles.none)
Group.new('jsObjectValue', colors.green_dark, colors.none, styles.none)
Group.new('jsOperator', colors.purple_violet, colors.none, styles.none)
Group.new('jsStorageClass', colors.green, colors.none, styles.none)
Group.new('jsTemplateBraces', colors.watermelon, colors.none, styles.none)
Group.new('jsTemplateExpression', colors.cyan_dark, colors.none, styles.none)
Group.new('jsThis', colors.cyan_dark, colors.none, styles.none)

-- JSX, 'MaxMEllon/vim-jsx-pretty' plugin
Group.new('jsxAttrib', colors.green, colors.none, styles.none)
Group.new('jsxClosePunct', colors.purple, colors.none, styles.none)
Group.new('jsxComponentName', colors.blue, colors.none, styles.none)
Group.new('jsxOpenPunct', colors.green, colors.none, styles.none)
Group.new('jsxTagName', colors.blue, colors.none, styles.none)

-- Lua
Group.new('luaBraces', colors.watermelon, colors.none, styles.none)
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
Group.new('phpClass', colors.green_dark, colors.none, styles.none)
Group.new('phpClasses', colors.purple_dark, colors.none, styles.none)
Group.new('phpFunction', colors.blue, colors.none, styles.none)
Group.new('phpParent', colors.none, colors.none, styles.none)
Group.new('phpType', colors.purple_violet, colors.none, styles.none)

-- PureScript
Group.new('purescriptClass', colors.peach, colors.none, styles.none)
Group.new('purescriptModuleParams', colors.orange, colors.none, styles.none)

-- Python
Group.new('pythonBuiltin', colors.blue, colors.none, styles.none)
Group.new('pythonClassVar', colors.green, colors.none, styles.none)
Group.new('pythonCoding', colors.blue, colors.none, styles.none)
Group.new('pythonImport', colors.watermelon, colors.none, styles.none)
Group.new('pythonOperator', colors.purple_violet, colors.none, styles.none)
Group.new('pythonRun', colors.blue, colors.none, styles.none)
Group.new('pythonStatement', colors.purple_violet, colors.none, styles.none)

-- Ruby
Group.new('erubyDelimiter', colors.watermelon, colors.none, styles.none)
Group.new('rubyAccess', colors.yellow, colors.none, styles.none)
Group.new('rspecGroupMethods', colors.blue, colors.none, styles.none)
Group.new('rubyAssertion', colors.blue, colors.none, styles.none)
Group.new('rubyAttribute', colors.blue, colors.none, styles.none)
Group.new('rubyBlockParameter', colors.green, colors.none, styles.none)
Group.new('rubyCallback', colors.blue, colors.none, styles.none)
Group.new('rubyClass', colors.orange, colors.none, styles.none)
Group.new('rubyClassName', colors.green_dark, colors.none, styles.none)
Group.new('rubyDefine', colors.purple_violet, colors.none, styles.none)
Group.new('rubyEntities', colors.blue, colors.none, styles.none)
Group.new('rubyExceptional', colors.orange, colors.none, styles.none)
Group.new('rubyGemfileMethod', colors.blue, colors.none, styles.none)
Group.new('rubyInstanceVariable', colors.cyan_dark, colors.none, styles.none)
Group.new('rubyInterpolationDelimiter', colors.watermelon, colors.none, styles.none)
Group.new('rubyMacro', colors.blue, colors.none, styles.none)
Group.new('rubyModule', colors.blue, colors.none, styles.none)
Group.new('rubyModuleName', colors.green_dark, colors.none, styles.none)
Group.new('rubyPseudoVariable', colors.green, colors.none, styles.none)
Group.new('rubyResponse', colors.blue, colors.none, styles.none)
Group.new('rubyRoute', colors.blue, colors.none, styles.none)
Group.new('rubySharpBang', colors.blue_light, colors.none, styles.none)
Group.new('rubyStringDelimiter', colors.tan, colors.none, styles.none)
Group.new('rubySymbol', colors.purple, colors.none, styles.none)

-- Rust
Group.new('rustAssert', colors.green, colors.none, styles.none)
Group.new('rustAttribute', colors.none, colors.none, styles.none)
Group.new('rustCharacterInvalid', colors.watermelon, colors.none, styles.none)
Group.new('rustCharacterInvalidUnicode', colors.watermelon, colors.none, styles.none)
Group.new('rustCommentBlockDoc', colors.blue_light, colors.none, styles.none)
Group.new('rustCommentBlockDocError', colors.blue_light, colors.none, styles.none)
Group.new('rustCommentLineDoc', colors.blue_light, colors.none, styles.none)
Group.new('rustCommentLineDocError', colors.blue_light, colors.none, styles.none)
Group.new('rustConstant', colors.orange, colors.none, styles.none)
Group.new('rustDerive', colors.green, colors.none, styles.none)
Group.new('rustEscapeError', colors.watermelon, colors.none, styles.none)
Group.new('rustFuncName', colors.blue, colors.none, styles.none)
Group.new('rustIdentifier', colors.blue, colors.none, styles.none)
Group.new('rustInvalidBareKeyword', colors.watermelon, colors.none, styles.none)
Group.new('rustKeyword', colors.purple_violet, colors.none, styles.none)
Group.new('rustLifetime', colors.purple_violet, colors.none, styles.none)
Group.new('rustMacro', colors.green, colors.none, styles.none)
Group.new('rustMacroVariable', colors.purple_violet, colors.none, styles.none)
Group.new('rustModPath', colors.purple_dark, colors.none, styles.none)
Group.new('rustObsoleteExternMod', colors.watermelon, colors.none, styles.none)
Group.new('rustObsoleteStorage', colors.watermelon, colors.none, styles.none)
Group.new('rustReservedKeyword', colors.watermelon, colors.none, styles.none)
Group.new('rustSelf', colors.cyan_dark, colors.none, styles.none)
Group.new('rustSigil', colors.cyan_dark, colors.none, styles.none)
Group.new('rustStorage', colors.purple_violet, colors.none, styles.none)
Group.new('rustStructure', colors.purple_violet, colors.none, styles.none)
Group.new('rustTrait', colors.green_dark, colors.none, styles.none)
Group.new('rustType', colors.green_dark, colors.none, styles.none)

-- Shell scripts
Group.new('shAlias', colors.cyan_dark, colors.none, styles.none)
Group.new('shCommandSub', colors.none, colors.none, styles.none)
Group.new('shLoop', colors.purple_violet, colors.none, styles.none)
Group.new('shSetList', colors.cyan_dark, colors.none, styles.none)
Group.new('shShellVariables', colors.green, colors.none, styles.none)
Group.new('shStatement', colors.none, colors.none, styles.none)
Group.new('shVariable', colors.cyan_dark, colors.none, styles.none)

-- TypeScript (leafgarland/typescript-vim)
Group.new('typescriptDOMObjects', colors.blue, colors.none, styles.none)
Group.new('typescriptFuncComma', colors.white, colors.none, styles.none)
Group.new('typescriptFuncKeyword', colors.green, colors.none, styles.none)
Group.new('typescriptGlobalObjects', colors.blue, colors.none, styles.none)
Group.new('typescriptIdentifier', colors.green, colors.none, styles.none)
Group.new('typescriptNull', colors.green, colors.none, styles.none)
Group.new('typescriptOpSymbols', colors.purple_violet, colors.none, styles.none)
Group.new('typescriptOperator', colors.watermelon, colors.none, styles.none)
Group.new('typescriptParens', colors.white, colors.none, styles.none)
Group.new('typescriptReserved', colors.purple_violet, colors.none, styles.none)
Group.new('typescriptStorageClass', colors.green, colors.none, styles.none)

-- TypeScript (HerringtonDarkholme/yats.vim)
Group.new('typeScriptModule', colors.blue, colors.none, styles.none)
Group.new('typescriptAbstract', colors.orange, colors.none, styles.none)
Group.new('typescriptArrayMethod', colors.blue, colors.none, styles.none)
Group.new('typescriptArrowFuncArg', colors.white, colors.none, styles.none)
Group.new('typescriptBOM', colors.green_dark, colors.none, styles.none)
Group.new('typescriptBOMHistoryMethod', colors.blue, colors.none, styles.none)
Group.new('typescriptBOMLocationMethod', colors.blue, colors.none, styles.none)
Group.new('typescriptBOMWindowProp', colors.green, colors.none, styles.none)
Group.new('typescriptBraces', colors.white, colors.none, styles.none)
Group.new('typescriptCall', colors.white, colors.none, styles.none)
Group.new('typescriptClassHeritage', colors.peach, colors.none, styles.none)
Group.new('typescriptClassKeyword', colors.purple_violet, colors.none, styles.none)
Group.new('typescriptClassName', colors.green_dark, colors.none, styles.none)
Group.new('typescriptDecorator', colors.green, colors.none, styles.none)
Group.new('typescriptDOMDocMethod', colors.blue, colors.none, styles.none)
Group.new('typescriptDOMEventTargetMethod', colors.blue, colors.none, styles.none)
Group.new('typescriptDOMNodeMethod', colors.blue, colors.none, styles.none)
Group.new('typescriptExceptions', colors.watermelon, colors.none, styles.none)
Group.new('typescriptFuncType', colors.white, colors.none, styles.none)
Group.new('typescriptMathStaticMethod', colors.blue, colors.none, styles.none)
Group.new('typescriptMethodAccessor', colors.purple_violet, colors.none, styles.none)
Group.new('typescriptObjectLabel', colors.blue, colors.none, styles.none)
Group.new('typescriptParamImpl', colors.white, colors.none, styles.none)
Group.new('typescriptStringMethod', colors.blue, colors.none, styles.none)
Group.new('typescriptTry', colors.watermelon, colors.none, styles.none)
Group.new('typescriptVariable', colors.green, colors.none, styles.none)
Group.new('typescriptXHRMethod', colors.blue, colors.none, styles.none)

-- Vimscript
Group.new('vimBracket', colors.blue, colors.none, styles.none)
Group.new('vimCommand', colors.orange, colors.none, styles.none)
Group.new('vimCommentTitle', colors.purple_violet, colors.none, styles.none)
Group.new('vimEnvvar', colors.watermelon, colors.none, styles.none)
Group.new('vimFuncName', colors.blue, colors.none, styles.none)
Group.new('vimFuncSID', colors.blue, colors.none, styles.none)
Group.new('vimFunction', colors.blue, colors.none, styles.none)
Group.new('vimNotation', colors.blue, colors.none, styles.none)
Group.new('vimOption', colors.cyan_dark, colors.none, styles.none)
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
Group.new('gitCommitDiscardedFile', colors.watermelon, colors.none, styles.none)
Group.new('gitCommitDiscardedType', colors.blue, colors.none, styles.none)
Group.new('gitCommitHeader', colors.purple, colors.none, styles.none)
Group.new('gitCommitSelectedFile', colors.green_dark, colors.none, styles.none)
Group.new('gitCommitSelectedType', colors.blue, colors.none, styles.none)
Group.new('gitCommitUntrackedFile', colors.watermelon, colors.none, styles.none)
Group.new('gitEmail', colors.blue, colors.none, styles.none)

-- Git commit diffs
Group.new('diffAdded', colors.green, colors.none, styles.none)
Group.new('diffChanged', colors.watermelon, colors.none, styles.none)
Group.new('diffIndexLine', colors.watermelon, colors.none, styles.none)
Group.new('diffLine', colors.blue, colors.none, styles.none)
Group.new('diffRemoved', colors.red, colors.none, styles.none)
Group.new('diffSubname', colors.blue, colors.none, styles.none)

-- Tagbar plugin
Group.new('TagbarFoldIcon', colors.blue_light, colors.none, styles.none)
Group.new('TagbarVisibilityPublic', colors.green, colors.none, styles.none)
Group.new('TagbarVisibilityProtected', colors.green, colors.none, styles.none)
Group.new('TagbarVisibilityPrivate', colors.green, colors.none, styles.none)
Group.new('TagbarKind', colors.green_dark, colors.none, styles.none)

-- NERDTree plugin
Group.new('NERDTreeClosable', colors.green, colors.none, styles.none)
Group.new('NERDTreeCWD', colors.purple, colors.none, styles.none)
Group.new('NERDTreeDir', colors.blue, colors.none, styles.none)
Group.new('NERDTreeDirSlash', colors.watermelon, colors.none, styles.none)
Group.new('NERDTreeExecFile', colors.tan, colors.none, styles.none)
Group.new('NERDTreeFile', colors.white, colors.none, styles.none)
Group.new('NERDTreeFlags', colors.purple, colors.none, styles.none)
Group.new('NERDTreeHelp', colors.blue_light, colors.none, styles.none)
Group.new('NERDTreeLinkDir', colors.blue, colors.none, styles.none)
Group.new('NERDTreeLinkFile', colors.blue, colors.none, styles.none)
Group.new('NERDTreeLinkTarget', colors.cyan_dark, colors.none, styles.none)
Group.new('NERDTreeOpenable', colors.green, colors.none, styles.none)
Group.new('NERDTreePart', colors.blue_darker, colors.none, styles.none)
Group.new('NERDTreePartFile', colors.blue_darker, colors.none, styles.none)
Group.new('NERDTreeUp', colors.blue, colors.none, styles.none)

-- NERDTree Git plugin
Group.new('NERDTreeGitStatusDirDirty', colors.tan, colors.none, styles.none)
Group.new('NERDTreeGitStatusModified', colors.watermelon, colors.none, styles.none)
Group.new('NERDTreeGitStatusRenamed', colors.blue, colors.none, styles.none)
Group.new('NERDTreeGitStatusStaged', colors.blue, colors.none, styles.none)
Group.new('NERDTreeGitStatusUntracked', colors.red, colors.none, styles.none)

-- vimfiler plugin
Group.new('vimfilerClosedFile', colors.blue, colors.none, styles.none)
Group.new('vimfilerMarkedFile', colors.orange, colors.none, styles.none)
Group.new('vimfilerNonMark', colors.green, colors.none, styles.none)
Group.new('vimfilerNormalFile', colors.white, colors.none, styles.none)
Group.new('vimfilerOpenedFile', colors.blue, colors.none, styles.none)
Group.new('vimfilerROFile', colors.blue_grey, colors.none, styles.none)

-- fern.vim plugin
Group.new('FernBranchSymbol', colors.green, colors.none, styles.none)
Group.new('FernBranchText', colors.blue, colors.none, styles.none)
Group.new('FernMarkedLine', colors.orange, colors.none, styles.none)
Group.new('FernMarkedText', colors.orange, colors.none, styles.none)
Group.new('FernRootSymbol', colors.purple, colors.none, styles.none)
Group.new('FernRootText', colors.purple, colors.none, styles.none)

-- fern-git-status.vim plugin
Group.new('FernGitStatusBracket', colors.blue_grey, colors.none, styles.none)
Group.new('FernGitStatusIndex', colors.green_dark, colors.none, styles.none)
Group.new('FernGitStatusWorktree', colors.watermelon, colors.none, styles.none)

-- Misc languages and plugins
Group.new('bufExplorerHelp', colors.blue_light, colors.none, styles.none)
Group.new('bufExplorerSortBy', colors.blue_light, colors.none, styles.none)
Group.new('CleverFDefaultLabel', colors.watermelon, colors.none, styles.none)
Group.new('CtrlPMatch', colors.orange, colors.none, styles.none)
Group.new('Directory', colors.green_dark, colors.none, styles.none)
Group.new('HighlightedyankRegion', colors.blue_darker, colors.none, styles.none)
Group.new('jsonKeyword', colors.blue, colors.none, styles.none)
Group.new('jsonBoolean', colors.cyan_dark, colors.none, styles.none)
Group.new('jsonQuote', colors.white, colors.none, styles.none)
Group.new('netrwClassify', colors.watermelon, colors.none, styles.none)
Group.new('netrwDir', colors.blue, colors.none, styles.none)
Group.new('netrwExe', colors.tan, colors.none, styles.none)
Group.new('tagName', colors.cyan_dark, colors.none, styles.none)
Group.new('Cheat40Header', colors.blue, colors.none, styles.none)
Group.new('Beacon', colors.white, colors.none, styles.none)

-- LuaTree
groups.LuaTreeFolderName = groups.Constant
groups.LuaTreeFolderIcon = groups.Operator
groups.LuaTreeMarkdownFile = groups.Operator



-- Colorizer
require 'colorizer'.setup({ 
    'css';
    'javascript';
    lua = { 
      names = false; -- dont parse names like 'blue'
      mode = 'foreground' 
    }; 
    html = { 
      names = false; -- dont parse names like 'blue'
      mode = 'background' 
    }; 
  })


-- Returned Module
_G.vimrc.colors = { 
  Color = Color,
  colors = colors,
  Group = Group, 
  styles = styles,
}

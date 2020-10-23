-- luacheck: Globals Color, c, Group, g, s, vim
_G.vim = _G.vim or {}
_G.vimrc.colors = _G.vimrc.colors or {}

-- Colorizer
require 'colorizer'.setup({ 
  'css'; 'javascript'; 'lua'; 'html'; 'markdown';
}, {
  names = false; -- dont parse names like 'blue'
  mode = 'background'
})

require'colorbuddy'.setup{}

local Color = require('colorbuddy.init').Color
local colors = require('colorbuddy.init').colors
local groups = require('colorbuddy.init').groups
local Group = require('colorbuddy.init').Group
local styles = require('colorbuddy.init').styles

_G.vimrc.colors.reset = function()
  vim.o.termguicolors = true
  vim.o.background  = 'dark'
  vim.g.colors_name = 'deus'

  local color_groups = {}
  local define_color_group = function(name, opts)
    color_groups[name] = {
      foreground = opts.foreground or colors.none,
      background = opts.background or colors.none,
      style = opts.style or styles.none,
      aliases = opts.aliases or {},
    }
  end

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
  define_color_group('Underlined', { style = styles.underline })

  define_color_group('Function', {
    foreground = colors.blue,
    background = colors.none,
    aliases    = {
      'TSConstructor',
      'TSFuncBuiltin',
      'TSFuncMacro',
      'goFunction',
      'goFunctionCall',
      'jsFuncBlock',
      'jsFuncCall',
      'jsFunction',
      'luaFuncCall',
      'luafunctioncall',
      'phpFunction',
      'rustFuncName',
      'vimFuncName',
      'vimFuncSID',
      'vimFunction',
      'vimUserFunc',
    },
  })

  define_color_group('Special', {
    foreground = colors.magenta_bold,
    aliases    = {},
  })

  define_color_group('Normal', {
    foreground = colors.white,
    background = colors.black,
    aliases    = {},
  })

  define_color_group('Operator', {
    foreground = colors.magenta_bold,
    aliases    = {},
  })

  define_color_group('Question', {
    foreground = colors.green,
    aliases    = {},
  })

  define_color_group('String', {
    foreground = colors.tan,
    background = colors.none,
    aliases    = {"Character"},
  })

  define_color_group('Statement', {
    foreground = colors.magenta,
    background = colors.none,
    aliases    = {},
  })

  define_color_group('Structure', {
    foreground = colors.magenta,
    background = colors.none,
    aliases    = {},
  })

  define_color_group('Identifier', {
    foreground = colors.green,
    background = colors.none,
    aliases    = {
	    "Type",
    },
  })

  define_color_group('Boolean', {
    foreground = colors.magenta_bold,
    style      = styles.bold,
    aliases    = { 'jsonBoolean' },
  })

  define_color_group('Constant', {
    foreground = colors.magenta_bold,
    aliases    = {"TSConstant"},
  })

  define_color_group('Error', {
    foreground = colors.red,
    background = colors.none,
    aliases    = {
      "TSError",
      "markdownError",
      "ErrorMsg",
    },
  })

  define_color_group('Exception', {
    foreground = colors.orange,
    background = colors.none,
    aliases    = {"Todo", "WarningMsg"},
  })

  define_color_group('Comment', {
    foreground = colors.gray_4,
    background = colors.none,
    aliases    = {"Conceal", "Delimiter", "LspDiagnosticHint"},
  })

  define_color_group('Directory', {
    foreground = colors.cyan,
    background = colors.none,
    aliases    = {
      'LuaTreeRootDir',
    },
  })

  define_color_group('Cursor', {
    foreground = colors.bg,
    background = colors.white_muted,
    aliases    = {"TermCursor"},
  })

  define_color_group('CursorColumn', {
    foreground = colors.none,
    background = colors.black_2,
    aliases    = {"CursorLine","CursorLineNr"},
  })

  define_color_group('FoldColumn', {
    foreground = colors.green,
    background = colors.gray_4,
    aliases    = {"Folded"},
  })

  define_color_group('Ignore', {
    foreground = colors.gray_3,
    background = colors.none,
    style = styles.underline,
  })

  define_color_group('IncSearch', {
    foreground = colors.peach,
    background = colors.bg,
  })

  define_color_group('Label', {
    foreground = colors.cyan_dark,
    background = colors.none,
  })

  define_color_group('MatchParen', {
    foreground = colors.orange,
    background = colors.bg,
    aliases    = {"luaBraces"},
  })

  define_color_group('ModeMsg', {
    foreground = colors.white_muted,
    background = colors.none,
  })

  define_color_group('MoreMsg', {
    foreground = colors.red,
    background = colors.none ,
  })

  define_color_group('NonText', {
    foreground = colors.orange,
    background = colors.none,
  })

  define_color_group('Pmenu', {
    foreground = colors.white_muted,
    background = colors.black,
  })

  define_color_group('PmenuSbar', {
    foreground = colors.white,
    background = colors.gray_3,
  })

  define_color_group('PmenuSel', {
    foreground = colors.white,
    background = colors.cyan_dark,
    aliases    = {"TelescopeSelection"},
  })

  define_color_group('PmenuThumb', {
    foreground = colors.fg,
    background = colors.purple_dark,
  })

  define_color_group('PreProc', {
    foreground = colors.magenta_bold,
    background = colors.none,
  })

  define_color_group('QuickFixLine', {
    foreground = colors.white,
    background = colors.gray_3,
  })

  define_color_group('Repeat', {
    foreground = colors.magenta,
    background = colors.none,
  })

  define_color_group('SignColumn', {
    foreground = colors.green,
    background = colors.black,
  })

  define_color_group('Special', {
    foreground = colors.magenta_bold,
    background = colors.none,
    aliases    = {"SpecialKey"},
  })

  define_color_group('User1', {
    foreground = colors.red,
    style      = styles.underline,
    aliases    = {"SpellBad", "diffRemoved"},
  })

  define_color_group('User2', {
    foreground = colors.green,
    style      = styles.underline,
    aliases    = {"SpellGood", "diffAdded"},
  })

  define_color_group('User3', {
    foreground = colors.yellow,
    style      = styles.underline,
    aliases    = {"SpellCap", "diffChanged"},
  })

  define_color_group('User4', {
    foreground = colors.blue,
    style      = styles.underline,
    aliases    = {"SpellLocal", "diffLine", "diffSubname"},
  })

  define_color_group('User5', {
    foreground = colors.cyan,
    style = styles.underline,
    aliases    = {"SpellRare"},
  })

  define_color_group('User6', {
    foreground = colors.magenta,
    style = styles.underline,
    aliases    = {"diffIndexLine"},
  })

  define_color_group('User7', {
    foreground = colors.purple,
    style = styles.underline,
    aliases    = {"Title"},
  })

  define_color_group('StatusLine', {
    foreground = colors.white,
    background = colors.black_2 })
  define_color_group('StatusLineNC', {
    foreground = colors.white_muted,
    background = colors.black_2 })
  define_color_group('StatusLineTerm', {
    foreground = colors.white,
    background = colors.black_2 })
  define_color_group('StatusLineTermNC', {
    foreground = colors.white_muted,
    background = colors.black_2 })
  define_color_group('StorageClass', { foreground = colors.orange })

  define_color_group('Tabline', {
    foreground = colors.white_muted,
    background = colors.black_2 })

  define_color_group('TablineFill', {
    foreground = colors.gray_4,
    background = colors.black_2,
  })

  define_color_group('TablineSel', {
    foreground = colors.cyan_dark,
    background = colors.black_2,
  })

  define_color_group('Search', {
    foreground = colors.gray_4,
    background = colors.orange,
  })


  define_color_group('VertSplit', {
    foreground = colors.gray_4,
    background = colors.gray_3,
  })

  define_color_group('Visual', {
    foreground = colors.none,
    style      = styles.none,
    background = colors.gray_2,
    aliases    = {"VisualInDiff", "VisualNOS"},
  })

  define_color_group('Whitespace', {
    foreground = colors.gray_3,
    background = colors.none,
  })

  define_color_group('WildMenu', {
    foreground = colors.white,
    background = colors.cyan_dark,
  })

  define_color_group('lCursor', {
    foreground = colors.bg,
    background = colors.white_muted,
  })

  -- define all highlight "color groups"
  for key, value in pairs(color_groups) do
    Group.new(key, value.foreground, value.background, value.style)
    if value.aliases and #value.aliases > 0 then
      for _, alias in ipairs(value.aliases) do
        if not groups[key] then vimrc.log.warn("color group "..key.." doesnt exist!") end
        Group.new(alias, groups[key]) -- alias back to definition.
      end
    end
  end

  -- Neovim Treesitter
  Group.new('TSAnnotation',      groups.Label)
  Group.new('TSAttribute',       groups.Label)
  Group.new('TSConstBuiltin',    groups.Constant)
  Group.new('TSConstMacro',      groups.Constant)
  Group.new('TSInclude',         groups.Type)
  Group.new('TSKeywordOperator', groups.Operator)
  Group.new('TSParameter',       groups.Identifier)
  Group.new('TSPunctSpecial',    groups.Delimiter)
  Group.new('TSTag',             groups.Type)
  Group.new('TSTagDelimiter',    groups.Delimiter)
  Group.new('TSVariableBuiltin', groups.Identifier)

  -- LUA
  Group.new('luabuiltin',      groups.Operator)
  Group.new('luakeyword',      groups.Operator)
  Group.new('luaBuiltin', colors.green, colors.none)
  Group.new('luaSpecialTable', groups.Special)

  -- C/C++
  Group.new('cDefine', groups.Special)
  Group.new('cPreCondit', colors.magenta, colors.none)
  Group.new('cStatement', groups.Statement)
  Group.new('cStructure', colors.orange, colors.none)
  Group.new('cppAccess', colors.green, colors.none)
  Group.new('cppCast', colors.cyan_light, colors.none)
  Group.new('cppCustomClass', colors.cyan_light, colors.none)
  Group.new('cppExceptions', colors.green, colors.none)
  Group.new('cppModifier', colors.magenta, colors.none)
  Group.new('cppOperator', groups.Operator)
  Group.new('cppSTLconstant', colors.purple_bold, colors.none)
  Group.new('cppSTLnamespace', colors.purple_bold, colors.none)
  Group.new('cppStatement', colors.cyan_light, colors.none)

  -- C#
  Group.new('csModifier', colors.green, colors.none)
  Group.new('csPrecondit', colors.magenta, colors.none)
  Group.new('csXmlTag', colors.blue, colors.none)

  -- Clojure
  Group.new('clojureDefine', colors.magenta, colors.none)
  Group.new('clojureKeyword', colors.cyan_light, colors.none)
  Group.new('clojureMacro', colors.orange, colors.none)
  Group.new('clojureParen', colors.blue, colors.none)
  Group.new('clojureSpecial', colors.magenta, colors.none)

  -- CoffeeScript
  Group.new('coffeeConstant', colors.orange, colors.none)
  Group.new('coffeeGlobal', colors.magenta_bold, colors.none)
  Group.new('coffeeKeyword', colors.orange, colors.none)
  Group.new('coffeeObject', colors.cyan, colors.none)
  Group.new('coffeeObjAssign', colors.blue, colors.none)
  Group.new('coffeeSpecialIdent', colors.cyan_light, colors.none)
  Group.new('coffeeSpecialVar', colors.blue, colors.none)
  Group.new('coffeeStatement', colors.orange, colors.none)

  -- Crystal
  Group.new('crystalAccess', colors.yellow, colors.none)
  Group.new('crystalAttribute', colors.blue, colors.none)
  Group.new('crystalBlockParameter', colors.green, colors.none)
  Group.new('crystalClass', colors.magenta, colors.none)
  Group.new('crystalDefine', colors.magenta, colors.none)
  Group.new('crystalExceptional', colors.orange, colors.none)
  Group.new('crystalInstanceVariable', colors.cyan_light, colors.none)
  Group.new('crystalModule', colors.blue, colors.none)
  Group.new('crystalPseudoVariable', colors.green, colors.none)
  Group.new('crystalSharpBang', colors.white_muted, colors.none)
  Group.new('crystalStringDelimiter', colors.tan, colors.none)

  -- CSS/SCSS
  Group.new('cssAttr', colors.cyan_light, colors.none)
  Group.new('cssClassName', colors.blue, colors.none)
  Group.new('cssColor', colors.cyan_light, colors.none)
  Group.new('cssIdentifier', colors.peach, colors.none)
  Group.new('cssProp', colors.cyan_light, colors.none)
  Group.new('cssValueNumber', colors.magenta, colors.none)
  Group.new('scssSelectorName', colors.blue, colors.none)

  -- Dart
  Group.new('dartMetadata', colors.green, colors.none)
  Group.new('dartStorageClass', colors.magenta, colors.none)
  Group.new('dartTypedef', colors.magenta, colors.none)
  Group.new('dartUserType', colors.blue, colors.none)

  -- Elixir
  Group.new('eelixirDelimiter', colors.magenta_bold, colors.none)
  Group.new('elixirAtom', colors.purple, colors.none)
  Group.new('elixirBlockDefinition', colors.magenta, colors.none)
  Group.new('elixirDefine', colors.magenta, colors.none)
  Group.new('elixirDocTest', colors.white_muted, colors.none)
  Group.new('elixirExUnitAssert', colors.green, colors.none)
  Group.new('elixirExUnitMacro', colors.blue, colors.none)
  Group.new('elixirKernelFunction', colors.green, colors.none)
  Group.new('elixirKeyword', colors.orange, colors.none)
  Group.new('elixirModuleDefine', colors.blue, colors.none)
  Group.new('elixirPrivateDefine', colors.magenta, colors.none)
  Group.new('elixirStringDelimiter', colors.tan, colors.none)
  Group.new('elixirVariable', colors.cyan_light, colors.none)

  -- Elm
  Group.new('elmLetBlockDefinition', colors.green, colors.none)
  Group.new('elmTopLevelDecl', colors.orange, colors.none)
  Group.new('elmType', groups.Type)

  -- Go
  Group.new('goBuiltins', colors.blue, colors.none)
  Group.new('goConditional', colors.magenta, colors.none)
  Group.new('goDeclType', colors.green, colors.none)
  Group.new('goDirective', colors.magenta_bold, colors.none)
  Group.new('goFloats', colors.orange, colors.none)
  Group.new('goImport', colors.magenta_bold, colors.none)
  Group.new('goLabel', colors.yellow, colors.none)
  Group.new('goMethod', colors.blue, colors.none)
  Group.new('goMethodCall', colors.blue, colors.none)
  Group.new('goPackage', colors.magenta, colors.none)
  Group.new('goSignedInts', colors.cyan, colors.none)
  Group.new('goStruct', colors.orange, colors.none)
  Group.new('goStructDef', colors.orange, colors.none)
  Group.new('goUnsignedInts', colors.orange, colors.none)
  -- HTML
  Group.new('htmlArg', colors.blue, colors.none)
  Group.new('htmlLink', colors.green, colors.none)
  Group.new('htmlEndTag', colors.purple, colors.none)
  Group.new('htmlH1', colors.magenta_bold, colors.none)
  Group.new('htmlH2', colors.orange, colors.none)
  Group.new('htmlTag', colors.green, colors.none)
  Group.new('htmlTagN', colors.blue, colors.none)
  Group.new('htmlTagName', colors.blue, colors.none)
  Group.new('htmlUnderline', colors.white, colors.none)
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
  Group.new('javaAnnotation', colors.green, colors.none)
  Group.new('javaClassDecl', colors.peach, colors.none)
  Group.new('javaCommentTitle', colors.white_muted, colors.none)
  Group.new('javaConstant', colors.blue, colors.none)
  Group.new('javaDebug', colors.blue, colors.none)
  Group.new('javaMethodDecl', colors.yellow, colors.none)
  Group.new('javaOperator', groups.Operator)
  Group.new('javaScopeDecl', colors.magenta, colors.none)
  Group.new('javaStatement', colors.cyan_light, colors.none)
  -- PHP
  Group.new('phpClass', colors.cyan, colors.none)
  Group.new('phpClasses', colors.purple_bold, colors.none)
  Group.new('phpParent', colors.none, colors.none)
  Group.new('phpType', groups.Type)
  -- Python
  Group.new('pythonBuiltin', colors.blue, colors.none)
  Group.new('pythonClassVar', colors.green, colors.none)
  Group.new('pythonCoding', colors.blue, colors.none)
  Group.new('pythonImport', colors.magenta_bold, colors.none)
  Group.new('pythonOperator', groups.Operator)
  Group.new('pythonRun', colors.blue, colors.none)
  Group.new('pythonStatement', groups.Statement)
  -- Ruby
  Group.new('erubyDelimiter', colors.magenta_bold, colors.none)
  Group.new('rspecGroupMethods', colors.blue, colors.none)
  Group.new('rubyAccess', colors.yellow, colors.none)
  Group.new('rubyAssertion', colors.blue, colors.none)
  Group.new('rubyAttribute', colors.blue, colors.none)
  Group.new('rubyBlockParameter', colors.green, colors.none)
  Group.new('rubyCallback', colors.blue, colors.none)
  Group.new('rubyClass', colors.orange, colors.none)
  Group.new('rubyClassName', colors.cyan, colors.none)
  Group.new('rubyDefine', colors.magenta, colors.none)
  Group.new('rubyEntities', colors.blue, colors.none)
  Group.new('rubyExceptional', colors.orange, colors.none)
  Group.new('rubyGemfileMethod', colors.blue, colors.none)
  Group.new('rubyInstanceVariable', colors.cyan_light, colors.none)
  Group.new('rubyInterpolationDelimiter', colors.magenta_bold, colors.none)
  Group.new('rubyMacro', colors.blue, colors.none)
  Group.new('rubyModule', colors.blue, colors.none)
  Group.new('rubyModuleName', colors.cyan, colors.none)
  Group.new('rubyPseudoVariable', colors.green, colors.none)
  Group.new('rubyResponse', colors.blue, colors.none)
  Group.new('rubyRoute', colors.blue, colors.none)
  Group.new('rubySharpBang', colors.white_muted, colors.none)
  Group.new('rubyStringDelimiter', colors.tan, colors.none)
  Group.new('rubySymbol', colors.purple, colors.none)
  -- Rust
  Group.new('rustAssert', colors.green, colors.none)
  Group.new('rustAttribute', colors.none, colors.none)
  Group.new('rustCharacterInvalid', colors.magenta_bold, colors.none)
  Group.new('rustCharacterInvalidUnicode', colors.magenta_bold, colors.none)
  Group.new('rustCommentBlockDoc', colors.white_muted, colors.none)
  Group.new('rustCommentBlockDocError', colors.white_muted, colors.none)
  Group.new('rustCommentLineDoc', colors.white_muted, colors.none)
  Group.new('rustCommentLineDocError', colors.white_muted, colors.none)
  Group.new('rustConstant', colors.orange, colors.none)
  Group.new('rustDerive', colors.green, colors.none)
  Group.new('rustEscapeError', colors.magenta_bold, colors.none)
  Group.new('rustIdentifier', colors.blue, colors.none)
  Group.new('rustInvalidBareKeyword', colors.magenta_bold, colors.none)
  Group.new('rustKeyword', colors.magenta, colors.none)
  Group.new('rustLifetime', colors.magenta, colors.none)
  Group.new('rustMacro', colors.green, colors.none)
  Group.new('rustMacroVariable', colors.magenta, colors.none)
  Group.new('rustModPath', colors.purple_bold, colors.none)
  Group.new('rustObsoleteExternMod', colors.magenta_bold, colors.none)
  Group.new('rustObsoleteStorage', colors.magenta_bold, colors.none)
  Group.new('rustReservedKeyword', colors.magenta_bold, colors.none)
  Group.new('rustSelf', colors.cyan_light, colors.none)
  Group.new('rustSigil', colors.cyan_light, colors.none)
  Group.new('rustStorage', colors.magenta, colors.none)
  Group.new('rustStructure', groups.Structure)
  Group.new('rustTrait', groups.Type)
  Group.new('rustType', groups.Type)
  -- Shell scripts
  Group.new('shAlias', colors.cyan_light, colors.none)
  Group.new('shCommandSub', colors.none, colors.none)
  Group.new('shLoop', colors.magenta, colors.none)
  Group.new('shSetList', colors.cyan_light, colors.none)
  Group.new('shShellVariables', colors.green, colors.none)
  Group.new('shStatement', colors.none, colors.none)
  Group.new('shVariable', colors.cyan_light, colors.none)
  -- Vimscript
  Group.new('vimBracket', colors.blue, colors.none)
  Group.new('vimCommand', colors.orange, colors.none)
  Group.new('vimCommentTitle', colors.magenta, colors.none)
  Group.new('vimEnvvar', colors.magenta_bold, colors.none)
  Group.new('vimNotation', colors.blue, colors.none)
  Group.new('vimOption', colors.cyan_light, colors.none)
  Group.new('vimParenSep', colors.white, colors.none)
  Group.new('vimSep', colors.white, colors.none)
  -- XML
  Group.new('xmlAttrib', colors.green, colors.none)
  Group.new('xmlEndTag', colors.blue, colors.none)
  Group.new('xmlTag', colors.green, colors.none)
  Group.new('xmlTagName', colors.blue, colors.none)
  -- Git commits
  Group.new('gitCommitBranch', colors.blue, colors.none)
  Group.new('gitCommitDiscardedFile', colors.magenta_bold, colors.none)
  Group.new('gitCommitDiscardedType', colors.blue, colors.none)
  Group.new('gitCommitHeader', colors.purple, colors.none)
  Group.new('gitCommitSelectedFile', colors.cyan, colors.none)
  Group.new('gitCommitSelectedType', colors.blue, colors.none)
  Group.new('gitCommitUntrackedFile', colors.magenta_bold, colors.none)
  Group.new('gitEmail', colors.blue, colors.none)
  -- Misc languages and plugins
  Group.new('bufExplorerHelp', colors.white_muted, colors.none)
  Group.new('bufExplorerSortBy', colors.white_muted, colors.none)
  Group.new('CleverFDefaultLabel', colors.magenta_bold, colors.none)
  Group.new('CtrlPMatch', colors.orange, colors.none)
  Group.new('HighlightedyankRegion', colors.gray_2, colors.none)
  Group.new('jsonKeyword', colors.blue, colors.none)
  Group.new('jsonQuote', colors.white, colors.none)
  Group.new('netrwClassify', colors.magenta_bold, colors.none)
  Group.new('netrwDir', colors.blue, colors.none)
  Group.new('netrwExe', colors.tan, colors.none)
  Group.new('tagName', colors.cyan_light, colors.none)
  Group.new('Cheat40Header', colors.blue, colors.none)
  Group.new('Beacon', colors.white, colors.none)
end


_G.vimrc.colors.reset()
_G.vimrc.colors.reset()

-- commands
local vimrc = _G["vimrc"]
paq {'shougo/deoplete-lsp'}
paq {'shougo/deoplete.nvim', run = vim.fn['remote#host#UpdateRemotePlugins']}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}



function setup_default_commands()
  vimrc.fn.bind_command('DE', { command = "tabedit <args>"; nargs = 1; complete = 'file'; })
  vimrc.fn.bind_command('TabView', { command = 'tab sview +setlocal\\ nomodifiable <args>'; nargs = 1; complete = 'file'; })
  vimrc.fn.bind_command('ReloadVimrc', { command = "lua vimrc.reload()"; })
  vimrc.fn.bind_command('LoadVimrc', { command = "lua vimrc.load()"; })
  vimrc.fn.bind_command('SetupVimrc', { command = "lua vimrc.setup()"; })
  vimrc.fn.bind_command('SetupVimrc', { command = "lua vimrc.setup()"; })
  vimrc.fn.bind_command('Diagnostics', { command = "lua vimrc.fn.diagnostics()"; })
  vimrc.fn.bind_command('PrintOptions', { command = "lua vimrc.fn.print_options()"; })
end


function vimrc.fn.bind_command(name, opts)
  vimrc.opts.commands[name] = { 
    name     = name;
    command  = opts["command"];
    nargs    = opts["nargs"] and opts["nargs"] or 0;
    bar      = opts["bar"]   and opts["bar"] or nil;
    range    = opts["range"] and opts["range"] or nil;
    complete = opts["nargs"] and opts["complete"] or nil;
  }
end


function command_init(name)
  local opts = vimrc.opts.commands[name]
  command = opts["command"]
  nargs = opts["nargs"] and '-nargs='..opts["nargs"] or ''
  range = opts["range"] and '-range='..opts["range"] or ''
  bar = opts["bar"] and '-bar' or ''
  complete = opts["complete"] and '-complete='..opts["complete"] or ''
  vim.cmd(table.concat({ "command!", bar, range, nargs, complete, name, command}, " "))
end


function setup_old_commands()
  vim.cmd [[
    " :TrimSpaces   OR   :'<,'>TrimSpaces {{{
    " nnoremap <S-F12>   m`:TrimSpaces<CR>``
    " vnoremap <S-F12>   :TrimSpaces<CR>
    function! TrimSpaces() range
      let oldhlsearch=ShowSpaces(1)
      execute a:firstline.",".a:lastline."substitute ///ge"
      let &hlsearch=oldhlsearch
    endfunction
    command! -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces() "}}}

    " :ShowSpaces [bool] {{{
    " nnoremap <F12>     :ShowSpaces 1<CR>
    function! ShowSpaces(...)
      let @/='\v(\s+$)|( +\ze\t)'
      let oldhlsearch=&hlsearch
      if !a:0
        let &hlsearch=!&hlsearch
      else
        let &hlsearch=a:1
      end
      return oldhlsearch
    endfunction
    command! -bar -nargs=? ShowSpaces call ShowSpaces(<args>) "}}}

    " :Jq [dictobj] - pretty print as json {{{
    " nnoremap <F12>     :ShowSpaces 1<CR>
    function! Jq(dictobj) abort
      tabnew
      setlocal ft=json5 buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
      setlocal nonumber norelativenumber nocursorline nolist
      " silent put='// Vim variables '. a:prefix . a:keyname
      let message = system('jq -Ser "."', json_encode(a:dictobj))
      silent put=message
      normal ggdd
      setlocal nomodifiable readonly
      autocmd BufLeave <buffer> bdelete
    endfunction

    command! -bar -nargs=1 -complete=var Jq call Jq(<args>) "}}}
  ]]
end

function vimrc.fn.init_commands()
  vimrc.opts.commands = { } -- clear commands's global namespace.

  -- set global nvim options.
  vimrc.opts.g["space_before_virtual_text"] = 1
  vimrc.opts.g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup

  setup_old_commands()
  setup_default_commands()
end

function vimrc.fn.setup_commands()
  for name, _ in pairs(vimrc.opts.commands) do command_init(name) end
end


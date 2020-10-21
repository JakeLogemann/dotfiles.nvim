require'vimp' -- vimpeccable, not vim.api
_G.vimrc.commands = vimrc.util.DeepTable()

local util = require('vimrc.util')

vimp.map_command('SvOpenFileOnGithub', function()
  print("Todo - Open the URL on github for current file on current line")
end)

vimp.map_command('DeleteFile', function() vim.cmd('silent !rm -f %') end)

vimp.map_command('SvRename', function(newName)
  print("Todo - rename current file to " .. newName)
end)

vimp.map_command('ReloadLuaVimrc', function()
  -- Remove all previously added vimpeccable maps
  vimp.unmap_all()
  -- Unload the lua namespace so that the next time require('vimrc') or
  -- require('vimrc.X') is called it will reload the file By default, require()
  -- will only load the lua file the first time it is called and thereafter
  -- pull it from a cache.
  util.unload_lua_namespace('vimrc')
  -- Make sure all open buffers are saved
  vim.cmd('silent wa')
  -- Execute our vimrc lua file again to add back our maps
  require('vimrc')

  print("Reloaded vimrc!")
end)

vim.cmd [[
command! -nargs=1 -complete=file DE tabedit <args> 
command! -nargs=1 -complete=file TabView tab sview +setlocal\ nomodifiable <args> 

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

" My Keybinding Configuration
"
" Maintainer:	Jake Logemann <jake.logemann@gmail.com>
"
" vim: fdm=marker

function! dotfiles#keybinds#init()
  call dotfiles#keybinds#normal()
  call dotfiles#keybinds#terminal()
  call dotfiles#keybinds#leader()
  call dotfiles#keybinds#completion()
endfunction

function! dotfiles#keybinds#reload()
  let l:filename = expand(g:dotfiles_vim_config_dir) . "/which_key.json"
  let g:which_key_my_json = json_decode(readfile(l:filename))
endfunction

function! dotfiles#keybinds#edit()
  execute printf("tabedit %s", expand(g:dotfiles_vim_config_dir) . "/which_key.json")
endfunction

function! dotfiles#keybinds#normal()
  "nnoremap                <c-h>           :SidewaysLeft<cr>
  "nnoremap                <c-l>           :SidewaysRight<cr>
  nnoremap <silent>       <Tab>           <C-w><C-w>
  nnoremap <silent>       <C-s>           :write<cr>
  nnoremap <silent>       <C-S-p>         :Clap commands<cr>
  nnoremap <silent>       <C-Space>       :Clap files<cr>
  nnoremap <silent>       <Esc><Esc>      :noh<cr>
endfunction

function! dotfiles#keybinds#terminal()
  tnoremap                <Esc><Esc>      <C-\><C-n>
endfunction

function! dotfiles#keybinds#leader()
  " WhichKey-specific keybinds
  nnoremap <silent>       <leader>        :<C-U>WhichKey! g:which_key_my_json.normal<CR>
  nnoremap <silent>       <localleader>   :<C-U>WhichKey! g:which_key_my_json.normal<CR>
  vnoremap <silent>       <leader>        :<C-U>WhichKeyVisual! g:which_key_my_json.visual<CR>
  vnoremap <silent>       <localleader>   :<C-U>WhichKeyVisual! g:which_key_my_json.visual<CR>
  " General configuration for "vim-which-key".
  let g:WhichKeyFormatFunc               = function('which_key#util#format')
  let g:which_key_align_by_seperator     = 1
  let g:which_key_default_group_name     = '.'
  let g:which_key_display_names          = {'<CR>': '↵', '<TAB>': '→'}
  let g:which_key_fallback_to_native_key = 1
  let g:which_key_flatten                = 1
  let g:which_key_floating_relative_win  = 0
  let g:which_key_hspace                 = 10
  let g:which_key_run_map_on_popup       = 0
  let g:which_key_sep                    = '‣'
  let g:which_key_sort_horizontal        = 0
  let g:which_key_timeout                = &timeoutlen
  let g:which_key_use_floating_win       = 1
  let g:which_key_vertical               = 1
  let g:which_key_disable_default_offset = 1
  " Load the definition from JSON separately for easier reloading.
  call dotfiles#keybinds#reload()
endfunction

function dotfiles#keybinds#completion()
  nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
endfunction

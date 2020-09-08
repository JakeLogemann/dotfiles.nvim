
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Release keymappings prefixes, evict entirely for use of plug-ins.
nnoremap <Space>  <Nop>
xnoremap <Space>  <Nop>
nnoremap ,        <Nop>
xnoremap ,        <Nop>
nnoremap \        <Nop>
xnoremap \        <Nop>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap        <F8>    :sbnext<CR>
nnoremap        <S-F8>  :sbprevious<CR>

inoremap <silent><expr> <C-Space>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

nnoremap <silent>       <leader>        :<C-U>WhichKey! g:which_key_my_json.normal<CR>
vnoremap <silent>       <leader>        :<C-U>WhichKeyVisual! g:which_key_my_json.visual<CR>
" nnoremap <silent>       <localleader>   :<C-U>WhichKey! g:which_key_my_json.normal<CR>
" vnoremap <silent>       <localleader>   :<C-U>WhichKeyVisual! g:which_key_my_json.visual<CR>

" Plugin Configurations
" =====================

" Plugin: Floating Window {{{1
autocmd User FloatPreviewWinOpen call <SID>DisableExtras()
function! s:DisableExtras()
  call nvim_win_set_option(g:float_preview#win, 'number', v:false)
  call nvim_win_set_option(g:float_preview#win, 'relativenumber', v:false)
  call nvim_win_set_option(g:float_preview#win, 'cursorline', v:false)
endfunction

let g:float_preview#docked     = 1  " default =  1
let g:float_preview#max_width  = 50 " default = 50
let g:float_preview#auto_close = 1  " default =  1

" Plugin: Illuminate {{{1
let g:Illuminate_ftblacklist = ['dirvish']

" Time in milliseconds (default 250)
let g:Illuminate_delay = 250

" Plugin: Completion {{{1
let g:completion_trigger_keyword_length = 3 " default = 1
let g:completion_trigger_on_delete = 1
let g:completion_timer_cycle = 200 "default value is 80

" Plugin: Buffer / Tab Line {{{1
let g:buftabline_show = 1

" Plugin: Lens {{{1
let g:lens#height_resize_max = 49

" Plugin: NeoVide {{{1
let g:neovide_cursor_vfx_mode = "railgun"

" Plugin: Plug {{{1
let g:plug_window = 'tabnew'

" Plugin: EchoDoc {{{1
let g:echodoc#enable_at_startup=0
let g:echodoc#type = 'virtual'
let g:echodoc#type="floating"

let g:vim_json_syntax_conceal = 0

" Plugin: Gutentags {{{1
let g:gutentags_dont_load=0
let g:gutentags_enabled=0
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_generate_on_missing = 0
let g:gutentags_generate_on_new = 0
let g:gutentags_generate_on_write = 0

" Plugin: Rust Configuration {{{1
let g:cargo_makeprg_params = 'build'
let g:cargo_shell_command_runner = '!'  " use exec instead of :terminal (?)
let g:rust_conceal = 1
let g:rust_conceal_mod_path = 0
let g:rust_conceal_pub = 1
let g:rust_fold = 1
let g:rust_recommended_style = 0
let g:rustfmt_autosave = 1
let g:rustfmt_autosave_if_config_present = 1
let g:rustfmt_fail_silently = 1

" Plugin: Iris (Minimal Email Client) {{{1
let g:iris_name  = "Jake Logemann"
let g:iris_mail = "jake.logemann@gmail.com"
let g:iris_imap_host  = "imap.gmail.com"
let g:iris_imap_port  = 993
let g:iris_imap_login = get(g:, 'iris_mail')
let g:iris_idle_enabled = 1
let g:iris_idle_timeout = 15
let g:iris_emails_chunk_size = 50
let g:iris_download_dir = "~/Downloads"

" Plugin: WhichKey {{{1
let g:WhichKeyFormatFunc               = function('which_key#util#format')
let g:which_key_align_by_seperator     = 1
let g:which_key_default_group_name     = '.'
let g:which_key_disable_default_offset = 1
let g:which_key_display_names          = {'<CR>': '↵', '<TAB>': '→'}
let g:which_key_fallback_to_native_key = 1
let g:which_key_flatten                = 1
let g:which_key_floating_relative_win  = 0
let g:which_key_hspace                 = 10
let g:which_key_my_json                = json_decode(readfile(expand(g:dotfiles_vim_config_dir) . "/which_key.json"))
let g:which_key_run_map_on_popup       = 0
let g:which_key_sep                    = '‣'
let g:which_key_sort_horizontal        = 0
let g:which_key_timeout                = 1
let g:which_key_use_floating_win       = 1
let g:which_key_vertical               = 1
"
" Wordy: bad grammar/writer patterns matcher {{{1
let g:wordy#ring = [
  \ 'weak',
  \ ['being', 'passive-voice', ],
  \ 'business-jargon',
  \ 'weasel',
  \ 'puffery',
  \ ['problematic', 'redundant', ],
  \ ['colloquial', 'idiomatic', 'similies', ],
  \ 'art-jargon',
  \ ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
  \ 'adjectives',
  \ 'adverbs',
  \ ]

" Statusline configuration {{{1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


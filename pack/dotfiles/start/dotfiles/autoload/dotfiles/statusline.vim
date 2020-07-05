" Statusline configuration.
function! dotfiles#statusline#init() 
  let g:lightline                              = get(g:, 'lightline', {})
  let g:lightline.active                       = get(g:lightline, 'active', {})
  let g:lightline.active.left                  = [['mode', 'paste', 'readonly'], ['filename', 'modified']]
  let g:lightline.active.right                 = [['lineinfo', 'percent', 'fileformat'], [ 'fileencoding', 'filetype' ], ['cocstatus']]
  let g:lightline.component                    = get(g:lightline, 'component', {})
  let g:lightline.component.absolutepath       = '%F'
  let g:lightline.component.bufnum             = '%n'
  let g:lightline.component.charvalue          = '%b'
  let g:lightline.component.charvaluehex       = '%B'
  let g:lightline.component.close              = ''
  let g:lightline.component.column             = '%c'
  let g:lightline.component.fileencoding       = '%{&fenc!=#"utf-8"?&fenc:""}'
  let g:lightline.component.fileformat         = '%{&ff!=#"unix"?&ff:""}'
  let g:lightline.component.filename           = '%t'
  let g:lightline.component.filetype           = '%{&ft!=#""?&ft:""}'
  let g:lightline.component.line               = '%l'
  let g:lightline.component.lineinfo           = '%3l:%-2v'
  let g:lightline.component.mode               = '%{lightline#mode()}'
  let g:lightline.component.modified           = '%M'
  let g:lightline.component.paste              = '%{&paste?"PASTE":""}'
  let g:lightline.component.percent            = '%3p%%'
  let g:lightline.component.percentwin         = '%P'
  let g:lightline.component.readonly           = '%R'
  let g:lightline.component.relativepath       = '%f'
  let g:lightline.component.spell              = '%{&spell?"SPELL":""}'
  let g:lightline.component.winnr              = '%{winnr()}'
  let g:lightline.component_function           = get(g:lightline, 'component_function', {})
  let g:lightline.component_function.cocstatus = 'coc#status'
  let g:lightline.inactive                     = get(g:lightline, 'inactive', {})
  let g:lightline.inactive.left                = [['filename','modified']]
  let g:lightline.inactive.right               = [['lineinfo'],['percent']]
  let g:lightline.mode_map                     = get(g:lightline, 'mode_map', {})
  let g:lightline.mode_map.R                   = ' R '
  let g:lightline.mode_map.S                   = '-S-'
  let g:lightline.mode_map.V                   = '-V-'
  let g:lightline.mode_map.c                   = 'CMD'
  let g:lightline.mode_map.i                   = ' I '
  let g:lightline.mode_map.n                   = ' N '
  let g:lightline.mode_map.s                   = ' S '
  let g:lightline.mode_map.t                   = ' T '
  let g:lightline.mode_map.v                   = ' V '
  let g:lightline.mode_map["\<C-s>"]           = '[S]'
  let g:lightline.mode_map["\<C-v>"]           = '[V]'
  let g:lightline.separator                    = {'left': '', 'right': '' }
  let g:lightline.subseparator                 = {'left': '', 'right': '' }
  let g:lightline.tab                          = get(g:lightline, 'tab', {})
  let g:lightline.tab.active                   = ['tabnum', 'filename', 'modified']
  let g:lightline.tab.inactive                 = ['tabnum', 'filename', 'modified']
  let g:lightline.tabline                      = get(g:lightline, 'tabline', {})
  let g:lightline.tabline.left                 = [['tabs']]
  let g:lightline.tabline.right                = [[]]
endfunction

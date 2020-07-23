execute printf("command! -nargs=0 Playground source %s", expand('<sfile>'))
"
" " Create a scratch buffer.
" let buf = nvim_create_buf(v:false, v:true)
" call nvim_buf_set_lines(buf, 0, -1, v:true, ["test", "text"])
"
" let opts = {}
" let opts['external'] = 1
" " let opts['relative'] = 'cursor'
" " let opts['width'] = 10
" " let opts['height'] = 10
" let opts['col'] = 0
" let opts['row'] = 1
" let opts['anchor'] = 'NW'
" let opts['style'] = 'minimal'
"
" " Open a floating window with previously built buffer.
" let win = nvim_open_win(buf, 0, opts)
" " optional: change highlight, otherwise Pmenu is used
" call nvim_win_set_option(win, 'winhl', 'Normal:MyHighlight')

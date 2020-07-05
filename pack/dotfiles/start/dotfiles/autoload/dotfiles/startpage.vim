" Startpage (startify) configuration.
function! dotfiles#startpage#init() 
  let g:startify_session_persistence = 1
  let g:startify_session_dir = printf('%s/sessions', $CACHE_DIR)
  let g:startify_files_number = 15
  let g:startify_update_oldfiles = 1
  let g:startify_enable_special = 0
  let g:startify_padding_left = 4
  let g:startify_enable_unsafe = 1
  let g:startify_change_to_vcs_root = 0
  let g:startify_session_delete_buffers = 1
  autocmd User Startified setlocal cursorline nonumber norelativenumber nonumber norelativenumber
  let g:startify_skiplist = [
          \ 'COMMIT_EDITMSG',
          \ 'bundle/.*/doc',
          \ '^/mnt/',
          \ '^/run/',
          \ '^/tmp/',
          \ ]

  let g:startify_bookmarks  = [
              \ {'w': '~/wiki'},
              \ {'c': '~/.config'},
              \ {'s': '~/.ssh/config'},
              \ ]
  let g:startify_commands  = [
              \ {'C': ['Search Commands','Commands']},
              \ {'D': ['Edit Config(s)','ConfigEdit']},
              \ {'E': ['Explore working directory','Explore']},
              \ {'F': ['Find File(s)...','Files']},
              \ {'H': ['Search help tags','Helptags']},
              \ {'R': ['Explore runtime directory', printf("Explore %s", expand('<sfile>:p:h'))]},
              \ {'N': ['Add note to personal wiki','VimwikiTabMakeDiaryNote']},
              \ {'W': ['Personal wiki','VimwikiTabIndex']},
              \ ]
  let g:startify_lists  = [
              \ {'type': 'sessions', 'header': ['Sessions']},
              \ {'type': 'commands', 'header': ['Commands']},
              \ {'type': 'files',    'header': ['Recent Files']},
              \ ]
  let g:startify_custom_header = []
endfunction

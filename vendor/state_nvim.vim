if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/home/jake/.config/nvim,/home/jake/.local/share/flatpak/exports/share/nvim/site,/var/lib/flatpak/exports/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/usr/share/nvim/runtime,/usr/lib/nvim,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/var/lib/flatpak/exports/share/nvim/site/after,/home/jake/.local/share/flatpak/exports/share/nvim/site/after,/home/jake/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/jake/.config/nvim/after,/usr/share/vim/vimfiles,/home/jake/.config/nvim/vendor/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/jake/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/jake/.config/nvim/vendor'
let g:dein#_runtime_path = '/home/jake/.config/nvim/vendor/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/jake/.config/nvim/vendor/.cache/init.vim'
let &runtimepath = '/home/jake/.config/nvim,/home/jake/.local/share/flatpak/exports/share/nvim/site,/var/lib/flatpak/exports/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/home/jake/.config/nvim/vendor/repos/github.com/Shougo/dein.vim,/home/jake/.config/nvim/vendor/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/jake/.config/nvim/vendor/.cache/init.vim/.dein/after,/usr/lib/nvim,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/var/lib/flatpak/exports/share/nvim/site/after,/home/jake/.local/share/flatpak/exports/share/nvim/site/after,/home/jake/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/jake/.config/nvim/after,/usr/share/vim/vimfiles'
filetype off
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* Limelight call dein#autoload#_on_cmd('Limelight', 'limelight', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* Goyo call dein#autoload#_on_cmd('Goyo', 'goyo', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* Cody call dein#autoload#_on_cmd('Cody', 'cody', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))

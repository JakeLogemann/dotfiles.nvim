local opts = {}
local config_dir = vim.fn.expand(vim.fn.stdpath('config'))
local local_dir = config_dir .. "/local"

opts['Illuminate_delay']                   = 250 -- milliseconds (default 250)
opts['Illuminate_ftblacklist']             = table.concat({"dirvish"}, ",")
opts['completion_enable_snippet']          = 'neosnippet'
opts['completion_matching_strategy_list']  = table.concat({'exact', 'substring', 'fuzzy'}, ",")
opts['completion_timer_cycle']             = 200 -- default 80
opts['completion_trigger_keyword_length']  = 2
opts['completion_trigger_keyword_length']  = 3 -- default 1
opts['completion_trigger_on_delete']       = 1 -- default 1
opts['deus_termcolors']                    = vim.o.t_Co
opts['echodoc#enable_at_startup']          = 1
opts['echodoc#type']                       = "floating"
opts['float_preview#auto_close']           = 1  -- default =  1
opts['float_preview#docked']               = 1  -- default =  1
opts['float_preview#max_width']            = 50 -- default = 50
opts['gutentags_dont_load']                = 0
opts['gutentags_enabled']                  = 0
opts['gutentags_generate_on_empty_buffer'] = 0
opts['gutentags_generate_on_missing']      = 0
opts['gutentags_generate_on_new']          = 0
opts['gutentags_generate_on_write']        = 0
opts['gutentags_generate_on_write']        = 0
opts['gutentags_generate_on_write']        = 0
opts['markdown_folding']                   = 1
opts['mapleader']                          = " "
opts['maplocalleader']                     = "\\"
opts['neosnippet#snippets_directory']      = config_dir .. '/local/snips'
opts['node_host_prog']                     = '/usr/bin/node'
opts['python3_host_prog']                  = '/usr/bin/python3'
opts['ruby_host_prog']                     = '/usr/bin/ruby'
opts['suda_smart_edit']                    = 1
opts['vim_config_file']                    = config_dir .. '/init.vim'
opts['vim_json_syntax_conceal']            = 0 -- dont hide quotes, etc in json.
opts['vimrc_config_dir']                   = config_dir
opts['vimrc_local_dir']                    = local_dir
opts['vimrc_lua_dir']                      = config_dir .. "/lua"
opts['vimrc_pack_dir']                     = config_dir .. "/pack"
opts['vimrc_plugins_dir']                  = local_dir .. "/plugins"
opts['vimrc_plugins_repos_dir']            = local_dir .. "/plugins/repos"
opts['vista_close_on_jump']                = 0
opts['vista_default_executive']            = 'nvim_lsp'
opts['vista_sidebar_keepalt']              = 0
opts['vista_sidebar_position']             = 'vertical botright'
opts['vista_sidebar_width']                = 35
opts['vista_stay_on_open']                 = 1

return opts

package.loaded['vimrc.options.env'] = nil
local env = {}
local config_dir = vim.fn.expand(vim.fn.stdpath('config'))
local local_dir = config_dir .. "/local"

env["BROWSER"]             = ""
env["COLORTERM"]           = "truecolor"
env["EDITOR"]              = "nvim"
env["FZF_CTRL_T_COMMAND"]  = "rg --files --no-ignore --hidden --follow -g '!{.git,node_modules}/*' 2> /dev/null"
env["FZF_DEFAULT_COMMAND"] = "rg --files --no-ignore --hidden --follow -g '!{.git,node_modules}/*' 2> /dev/null"
env["FZF_DEFAULT_OPTS"]    = "--layout=reverse -m --min-height=100 --color=16 --ansi --tabstop=2 --cycle"
env["GCC_COLORS"]          = "error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
env["GIT_ASKPASS"]         = true
env["LANG"]                = "en_US.utf8"
env["LC_ADDRESS"]          = "en_US.UTF-8"
env["LC_IDENTIFICATION"]   = "en_US.UTF-8"
env["LC_MEASUREMENT"]      = "en_US.UTF-8"
env["LC_MONETARY"]         = "en_US.UTF-8"
env["LC_NAME"]             = "en_US.UTF-8"
env["LC_NUMERIC"]          = "en_US.UTF-8"
env["LC_PAPER"]            = "en_US.UTF-8"
env["LC_TELEPHONE"]        = "en_US.UTF-8"
env["LC_TIME"]             = "en_US.UTF-8"
env["LESS"]                = "-BFfQrms -x2 -~ --quit-on-intr"
env["MANPAGER"]            = "nvim -n +Man!"
env["MANWIDTH"]            = "999"
env["PAGER"]               = "less"
env["SCCACHE_CACHE_SIZE"]  = "100G"
env["SCCACHE_DIR"]         = "/home/jake/.cache/sccache"
env["SHELL"]               = "/bin/zsh"

return env

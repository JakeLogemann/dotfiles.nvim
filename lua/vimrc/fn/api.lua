local vimrc = _G["vimrc"]

function vimrc.fn.new_github_client(token, url)
  if url == nil then url = "https://api.github.com" end
  local spec = require('daedalus.specs').define{
    ['*'] = { -- default attributes of following spec entries.
      url = url,
      handler = function(data)
        -- the handler function receives already parsed objects
        print(vim.inspect(data))
      end, 
      -- you can specify default values that will be shared for all api specs
      auth = "Bearer " .. token,
    },
    issues = {
      path = "/issues",
      -- handler = issues_handler -- you can override global definitions per-api route
    },
    create_issue = {
      path = "/repos/${owner}/${repo}/issues",
      method = "post",

    }
  }

  -- if you don't supply any arguments, the default values will be used
  -- github.issues{}
  --
  -- -- if you need to override any default behavior, you can 
  -- -- do so through arguments:
  -- github.issues{
  --   before = function(cmd)
  --     -- if you need to extend the curl command or debug it before calling,
  --     -- override this function
  --     return cmd
  --   end,
  --   handler = function(ret)
  --     -- the handler function receives already parsed objects
  --     print(vim.inspect(ret))
  --   end,
  --   decode = function(str)
  --     -- if you need to parse values other than json, override this function
  --     return vim.fn.json_decode(str)
  --   end
  -- }
  -- 
  -- github.create_issue{
  --   urlargs = {
  --     owner = "hkupty",
  --     repo = "daedalus.nvim"
  --   },
  --   payload = {
  --       title = "Daedalus is awesome!",
  --       body = "I'm testing daedalus and I think it's amazing! Thanks :)"
  --   }
  -- }
  return require('daedalus').make_client(spec)
end


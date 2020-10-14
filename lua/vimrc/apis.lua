local M = {}
local daedalus = require("daedalus")
local specs = require("daedalus.specs")
local helpers = require("daedalus.helpers")

local function pass_token(secret_name) return vim.fn.system("pass show " .. secret_name) end

local function default_handler(data)
  -- the handler function receives already parsed objects
  print(vim.inspect(data))
end

return {
  github = daedalus.make_client(specs.define{
      ['*'] = { -- default attributes of following spec entries.
        url = "https://api.github.com",
        handler = default_handler, -- you can specify default values that will be shared for all api specs
        auth = "Bearer " .. pass_token("JakeLogemann@github.com"),
      },
      issues = {
        path = "/issues",
        -- handler = issues_handler -- you can override global definitions per-api route
      },
      create_issue = {
        path = "/repos/${owner}/${repo}/issues",
        method = "post",

      }
    }),
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

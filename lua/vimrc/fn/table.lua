local vimrc = _G["vimrc"]

function vimrc.fn.random_string(length)
  -- generate a random string of arbitrary length.
  if not length or length <= 0 then return '' end
  math.randomseed(os.clock()^5)
  return vimrc.fn.random_string(length - 1) .. charset[math.random(1, #charset)]
end


function vimrc.fn.deep_table()
  local auto, assign

  function auto(tab, key)
    return setmetatable({}, {
        __index = auto,
        __newindex = assign,
        parent = tab,
        key = key
      })
  end

  local meta = {
    __index = auto
  }

  -- The if statement below prevents the table from being
  -- created if the value assigned is nil. This is, I think,
  -- technically correct but it might be desirable to use
  -- assignment to nil to force a table into existence.

  function assign(tab, key, val)
    -- if val ~= nil then
    local oldmt = getmetatable(tab)
    oldmt.parent[oldmt.key] = tab
    setmetatable(tab, meta)
    tab[key] = val
    -- end
  end


  return setmetatable({}, meta)
end

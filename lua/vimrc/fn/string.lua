local vimrc = _G["vimrc"]

function vimrc.fn.random_string(length)
  -- generate a random string of arbitrary length.
  if not length or length <= 0 then return '' end
  math.randomseed(os.clock()^5)
  return vimrc.fn.random_string(length - 1) .. charset[math.random(1, #charset)]
end


-- Turn some special character value into a character code.
function vimrc.fn.to_char(val)
  return eval('"\\'..val..'"')
end

function vimrc.fn.lstriplines(s)
  local ls = pl.stringx.splitlines(s)
  ls = pl.tablex.map(function(li) return pl.stringx.lstrip(li) end, ls)
  return table.concat(ls, "\n")
end


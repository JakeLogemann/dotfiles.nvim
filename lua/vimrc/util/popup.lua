require'popup'.create(vim.fn.readfile("i3d.net.txt"), {
    title = 'coool',
    line = 1,
    col = 1,
    pos = "botleft",
    time = 4000,
    padding = { 0, 3, 0, 3 },
    -- border = { 1, 1, 1, 1 }
  })


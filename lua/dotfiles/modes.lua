local modes = {}

function modes.example_modal()
  require'libmodal'.mode.enter('FooMode', {
      ['z'] = 'lua FooMode()',
    })
end

return modes

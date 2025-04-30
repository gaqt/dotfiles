vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
vim.keymap.set('n',             'S', '<Plug>(leap-backward)')

require('flit').setup {}
require('telepath').use_default_mappings()

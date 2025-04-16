
require('neo-tree').setup {
    close_if_last_window = true,
}

vim.keymap.set('n', '<leader>e', '<cmd>Neotree reveal float toggle<cr>')

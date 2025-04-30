vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>z', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
vim.keymap.set('n', '<leader>s', '<cmd>Telescope lsp_document_symbols<cr>')
vim.keymap.set('n', '<leader>l', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>,', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>.', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>o', '<cmd>Telescope jumplist<cr>')
require('telescope').load_extension('fzf')
require('telescope').setup {
    defaults = {
        border = true
    }
}

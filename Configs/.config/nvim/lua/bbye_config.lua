local function delete_all_buffers_but_self()
    local r, c = unpack(vim.api.nvim_win_get_cursor(0))
    vim.cmd('%bd|e#')
    vim.api.nvim_win_set_cursor(0, { r, c })
end

vim.keymap.set('n', '<leader>k', '<cmd>Bdelete<cr>')
vim.keymap.set('n', '<leader>K', delete_all_buffers_but_self)

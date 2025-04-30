
local bufferline = require("bufferline")
bufferline.setup {
    options = {
        mode = "tabs",
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
        },
        numbers = "ordinal",
        separator_style = {'|', '|'},
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. " " .. count
        end,
        indicator = {
            style = "underline"
        }
    }
}

vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<CR>')
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<CR>')

function bl_goto(num)
    return function()
        bufferline.go_to(num, true)
    end
end

vim.keymap.set('n', '<leader>1', bl_goto(1))
vim.keymap.set('n', '<leader>2', bl_goto(2))
vim.keymap.set('n', '<leader>3', bl_goto(3))
vim.keymap.set('n', '<leader>4', bl_goto(4))
vim.keymap.set('n', '<leader>5', bl_goto(5))
vim.keymap.set('n', '<leader>6', bl_goto(6))
vim.keymap.set('n', '<leader>7', bl_goto(7))
vim.keymap.set('n', '<leader>8', bl_goto(8))
vim.keymap.set('n', '<leader>9', bl_goto(9))
vim.keymap.set('n', '<leader>$', bl_goto(-1))

vim.keymap.set('n', '<leader>t1', '<cmd>tabmove 0<CR>')
vim.keymap.set('n', '<leader>t2', '<cmd>tabmove 1<CR>')
vim.keymap.set('n', '<leader>t3', '<cmd>tabmove 2<CR>')
vim.keymap.set('n', '<leader>t4', '<cmd>tabmove 3<CR>')
vim.keymap.set('n', '<leader>t5', '<cmd>tabmove 4<CR>')
vim.keymap.set('n', '<leader>t6', '<cmd>tabmove 5<CR>')
vim.keymap.set('n', '<leader>t7', '<cmd>tabmove 6<CR>')
vim.keymap.set('n', '<leader>t8', '<cmd>tabmove 7<CR>')
vim.keymap.set('n', '<leader>t9', '<cmd>tabmove 8<CR>')


vim.keymap.set('n', '<leader>tj', '<cmd>tabmove -<CR>')
vim.keymap.set('n', '<leader>tk', '<cmd>tabmove +<CR>')


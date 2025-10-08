require('luasnip.loaders.from_vscode').lazy_load()

-- local luasnip = require('luasnip')
--
-- vim.keymap.set({ "i", "s" }, "<C-l>", function() luasnip.jump(1) end,
--     { silent = true })
-- vim.keymap.set({ "i", "s" }, "<C-h>", function() luasnip.jump(-1) end,
--     { silent = true })
--
-- vim.keymap.set({ "i", "s" }, "<C-k>", function()
--     if luasnip.choice_active() then
--         luasnip.change_choice(1)
--     end
-- end, { silent = true })
--
-- vim.keymap.set({ "i", "s" }, "<C-j>", function()
--     if luasnip.choice_active() then
--         luasnip.change_choice(-1)
--     end
-- end, { silent = true })

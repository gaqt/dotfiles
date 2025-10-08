require('rawinit')

require('lazy_config')
require('lualine_config')
require('explorer_config')
require('treesitter_config')
require('telescope_config')
require('bbye_config')
require('lsp_config')
require('completion_config')
require('diagnostic_config')
require('tabs_config')
require('harpoon_config')
require('snippets_config')
require('dap_config')
require('spectre_config')

-- Disable Copilot
vim.cmd("Copilot disable")

-- colorscheme

-- require('fluoromachine').setup {
--    glow = false,
--    theme = 'delta',
--    transparent = true,
-- }
-- vim.cmd.colorscheme 'fluoromachine'
-- vim.api.nvim_set_hl(0, 'Visual', { bg = "#bf107f", fg = "#ffffff" });

-- require('nightfox').setup({
--    options = {
--       transparent = true
--    }
-- })
-- vim.cmd.colorscheme "nightfox"

vim.cmd.colorscheme "oxocarbon"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

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
require('leap_config')
require('dap_config')
require('spectre_config')

-- Disable Copilot
vim.cmd("Copilot disable")

-- colorscheme

-- vim.cmd.colorscheme 'tokyodark'
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#202030', fg = "#f0f0f0" })
-- vim.api.nvim_set_hl(0, 'FLoatBorder', { bg = '#202030', fg = "#f0f0f0" })

-- vim.g.gruvbox_material_background = 'hard'
-- vim.g.gruvbox_material_better_performance = 1
-- vim.cmd.colorscheme 'gruvbox-material'

-- require('solarized').setup({ variant = "summer", transparent = { enabled = true } })
-- vim.cmd.colorscheme 'solarized'

vim.g.moonflyTransparent = true
vim.cmd.colorscheme 'moonfly'

-- require('fluoromachine').setup {
--    glow = false,
--    theme = 'delta',
--    transparent = true,
-- }
-- vim.cmd.colorscheme 'fluoromachine'

-- vim.cmd.let "g:PaperColor_Theme_Options = {'theme': {'default.dark': {'transparent_background': 1}}}"
-- vim.cmd.colorscheme 'PaperColor'

local trouble = require("trouble")
-- local symbols = trouble.statusline({
--     mode = "lsp_document_symbols",
--     groups = {},
--     title = false,
--     filter = { range = true },
--     format = "{kind_icon}{symbol.name:Normal}",
--     -- The following line is needed to fix the background color
--     -- Set it to the lualine section you want to use
--     hl_group = "lualine_c_normal",
-- })

require('lualine').setup {
    options = {
        section_separatos = '',
        component_separators = ''
    },
}

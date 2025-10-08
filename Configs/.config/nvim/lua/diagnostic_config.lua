local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({ name = 'DiagnosticSignError', text = '' })
sign({ name = 'DiagnosticSignWarn', text = '' })
sign({ name = 'DiagnosticSignHint', text = '' })
sign({ name = 'DiagnosticSignInfo', text = '' })

vim.diagnostic.config({
    update_in_insert = true,
    virtual_text = true,
    severity_sort = true,
    float = {
        border = 'rounded', -- values are: none, single, double, rounded, solid, shadow
        source = 'always',
    },
})

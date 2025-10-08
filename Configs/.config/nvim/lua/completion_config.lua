vim.opt.completeopt = 'menu,preview'

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = { behavior = cmp.SelectBehavior.Select }
local scroll_opts = { behavior = cmp.SelectBehavior.Select, count = 10 }

cmp.setup({
    preselect = cmp.PreselectMode.Item, -- Item or None
    experimental = {
        ghost_text = true
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    -- uncomment to enable automatic completions
    sources = {
        { name = 'copilot', priority = 750 },
        { name = 'luasnip', priority = 1000 },
        { name = 'path',    priority = 100, keyword_length = 3 },
        { name = 'nvim_lsp', priority = 500, keyword_length = 3 },
        -- { name = 'buffer',  priority = 200, keyword_length = 3 },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '@',
                buffer = 'Ω',
                path = '$',
                copilot = ''
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
        ['<up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-f>'] = cmp.mapping.select_next_item(scroll_opts),
        ['<C-b>'] = cmp.mapping.select_prev_item(scroll_opts),
        -- ['<escape>'] = cmp.mapping.abort(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-c>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-x><C-o>'] = cmp.mapping(function()
            cmp.complete({
                config = {
                    sources = {
                        { name = 'copilot',  priority = 750 },
                        { name = 'luasnip',  priority = 1000 },
                        { name = 'path',     priority = 100 },
                        { name = 'nvim_lsp', priority = 500 },
                        -- { name = 'buffer',   priority = 200 },
                    }
                }
            })
        end, { 'i', 's' }),

        -- ['<C-j>'] = cmp.mapping(function()
        --     cmp.complete({
        --         config = {
        --             sources = {
        --                 { name = 'copilot' },
        --             }
        --         }
        --     })
        -- end, { 'i', 's' }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

        -- ["<C-l>"] = cmp.mapping(function(fallback)
        --     if luasnip.choice_active() then
        --         luasnip.change_choice(1)
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),
        --
        -- ["<C-h>"] = cmp.mapping(function(fallback)
        --     if luasnip.choice_active() then
        --         luasnip.change_choice(1)
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" })
    },
})

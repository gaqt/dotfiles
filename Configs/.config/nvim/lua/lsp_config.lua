
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup()
require('mason-lspconfig').setup {
   ensure_installed = { 'cssls', 'html' }
}

-- lspconfig.lua_ls.setup {
--                 capabilities = capabilities,
--                 on_init = function(client)
--                     local path = client.workspace_folders[1].name
--                     if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
--                         client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
--                             Lua = {
--                                 runtime = {
--                                     -- Tell the language server which version of Lua you're using
--                                     -- (most likely LuaJIT in the case of Neovim)
--                                     version = 'LuaJIT'
--                                 },
--                                 -- Make the server aware of Neovim runtime files
--                                 workspace = {
--                                     checkThirdParty = false,
--                                     library = {
--                                         vim.env.VIMRUNTIME
--                                         -- "${3rd}/luv/library"
--                                         -- "${3rd}/busted/library",
--                                     }
--                                     -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
--                                     -- library = vim.api.nvim_get_runtime_file("", true)
--                                 }
--                             }
--                         })
--
--                         client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
--                     end
--                     return true
--                 end
-- }

vim.lsp.config('rust-analyzer', {
                settings = {
                    ["rust-analyzer"] = {
                        imports = {
                            granularity = {
                                group = "module",
                            },
                            prefix = "self",
                        },
                        cargo = {
                            buildScripts = {
                                enable = true,
                                overrideCommand = vim.g.rust_analyzer_cmd
                            },
                            allFeatures = true,
                            allTargets = true,
                        },
                        procMacro = {
                            enable = true
                        },
                        checkOnSave = {
                            allFeatures = true,
                            allTargets = true,
                        },
                        check = {
                            overrideCommand = vim.g.rust_analyzer_cmd
                        }
                    }
                }
})

vim.lsp.config('jinja_lsp', {
    filetypes = { 'html', 'htmldjango', 'templ' }
})

vim.lsp.config('htmx', {
    filetypes = { 'html', 'htmldjango', 'templ' }
})

vim.lsp.config("html", {
    filetypes = { 'html', 'htmldjango', 'templ' }
})

vim.lsp.config('emmet_language_server', {
    filetypes = { 'html', 'htmldjango', 'templ', 'typescriptreact', 'erb' }
})

vim.lsp.enable("emmylua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("ts_ls")
vim.lsp.enable("htmx")
vim.lsp.enable("emmet_language_server")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("jinja_lsp")
vim.lsp.enable("pyright")


vim.keymap.set('n', '<leader>x', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>m', vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>ta', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>tr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>tl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end
})

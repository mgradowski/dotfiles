local cmp = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")
local luasnip = require("luasnip")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")
local null_ls = require("null-ls")


vim.api.nvim_create_autocmd(
    "LspAttach",
    {
        callback = function(event)
            local opts = { buffer = event.bufnr, remap = true }

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        end
    }
)

vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        callback = function(event)
            vim.lsp.buf.format({
                async = false,
                bufnr = event.bufnr,
            })
        end
    }
)


mason.setup({})
mason_lspconfig.setup({
    ensure_installed = {
        "bashls",
        "gopls",
        "jsonls",
        "lua_ls",
        "pyright",
        "tsserver",
        "yamlls",
    },
    handlers = {
        -- default handler
        function(server)
            lspconfig[server].setup({
                capabilities = cmp_nvim_lsp.default_capabilities(),
            })
        end,

        -- Neovim Lua config
        lua_ls = function()
            lspconfig.lua_ls.setup({
                capabilities = cmp_nvim_lsp.default_capabilities(),
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = { vim.env.VIMRUNTIME, }
                        }
                    }
                }
            })
        end
    },
})

cmp.setup({
    sources = { { name = "nvim_lsp" } },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-k>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
})

mason_null_ls.setup({
    ensure_installed = {
        "autoflake",
        "black",
        "isort",
    }
})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.autoflake,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
    }
})

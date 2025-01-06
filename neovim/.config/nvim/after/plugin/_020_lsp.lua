local lazydev = require('lazydev')
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")
local null_ls = require('null-ls')

mason_lspconfig.setup({
    ensure_installed = {
        "gopls",
        "lua_ls",
        "pyright",
    },
    automatic_installation = false,
    handlers = {
        -- default handler
        function(server)
            require('lspconfig')[server].setup({
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            })
        end,
    },
})

lazydev.setup()

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.autoflake,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
    }

})


mason_null_ls.setup({
    ensure_installed = {
        "autoflake",
        "black",
        "isort",
    },
    automatic_installation = false,
})


vim.api.nvim_create_autocmd(
    "LspAttach",
    {
        callback = function(event)
            local opts = { buffer = event.bufnr, remap = true }
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
            vim.keymap.set("n", "K", function()
                if require('dap').session() then
                    require('dap.ui.widgets').hover()
                else
                    vim.lsp.buf.hover()
                end
            end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", require("telescope.builtin").lsp_references, opts)
            vim.keymap.set("n", "<leader>vws", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)
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
--
-- lspconfig.beancount.setup({
--     init_options = {
--         journal_file = vim.fn.expand("~/projects/ledger/main.bean")
--     }
-- })
--
-- vim.filetype.add({
--     extension = {
--         bean = 'beancount',
--     }
-- })

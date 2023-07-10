local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    "bashls",
    "gopls",
    "jsonls",
    "lua_ls",
    "pyright",
    "tsserver",
    "yamlls",
})

local cmp = require('cmp')
lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("i", "<C-k>", cmp.mapping.confirm({ select = true }), opts)
    lsp.buffer_autoformat()
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

require("mason-null-ls").setup({
    ensure_installed = { "isort", "black", "autoflake" }
})

local null_ls = require("null-ls")
local sources = {
    null_ls.builtins.formatting.autoflake,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black,
}

null_ls.setup({ sources = sources })

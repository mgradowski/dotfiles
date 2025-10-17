local lazydev = require('lazydev')
local mason_lspconfig =
    require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")
local
null_ls = require('null-ls')

mason_lspconfig.setup({
    handlers = {
        -- default handler
        function(server)
            vim.lsp.config(server, {
                capabilities =
                    require('cmp_nvim_lsp').default_capabilities(),
            })
        end, },
})

lazydev.setup()

mason_null_ls.setup({
    ensure_installed = {
        "ruff",
    },
    handlers = {},
    automatic_installation = false,
})

null_ls.setup()

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        vim.keymap.set("n", "gd",
            function() vim.lsp.buf.definition() end,
            {
                desc = "LSP: Go to definition",
                buffer = event.buf,
                remap =
                    true,
            })

        vim.keymap.set("n", "gi",
            function() vim.lsp.buf.implementation() end,
            {
                desc = "LSP: Go to implementation",
                buffer = event.buf,
                remap =
                    true
            })

        vim.keymap.set(
            "n", "K",
            function()
                if require('dap').session() then
                    require('dap.ui.widgets').hover()
                else
                    vim.lsp.buf.hover()
                end
            end,
            {
                desc = "LSP/DAP: Hover",
                buffer = event.buf,
                remap = true
            })

        vim.keymap.set(
            "n", "<leader>vca",
            function() vim.lsp.buf.code_action() end,
            {
                desc = "LSP: Show code actions",
                buffer = event.buf,
                remap = true
            })

        vim.keymap.set(
            "n", "<leader>vcr",
            require("telescope.builtin").lsp_references,
            {
                desc = "LSP: Show references",
                buffer = event.buf,
                remap = true
            })

        vim.keymap.set("n", "<leader>vcs", require("telescope.builtin").lsp_dynamic_workspace_symbols,
            {
                desc = "LSP: Show workspace symbols",
                buffer = event.buf,
                remap = true
            })

        vim.keymap.set("n", "<leader>vcn", function() vim.lsp.buf.rename() end,
            {
                desc = "LSP: Rename",
                buffer = event.buf,
                remap = true
            })
    end
}
)

vim.g.autoformat_enabled = true

local autoformat_group = vim.api.nvim_create_augroup("AutoFormat", { clear = true })
vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        group = autoformat_group,
        callback = function(event)
            if vim.g.autoformat_enabled then
                vim.lsp.buf.format({
                    async = false,
                    bufnr = event.buf,
                })
            end
        end
    }
)
vim.api.nvim_create_user_command("AutoformatEnable", function()
    vim.g.autoformat_enabled = true
    vim.notify("Autoformatting enabled")
end, {})

vim.api.nvim_create_user_command("AutoformatDisable", function()
    vim.g.autoformat_enabled = false
    vim.notify("Autoformatting disabled")
end, {})

vim.api.nvim_create_user_command("AutoformatToggle", function()
    vim.g.autoformat_enabled = not vim.g.autoformat_enabled
    vim.notify("Autoformatting " .. (vim.g.autoformat_enabled and "enabled" or "disabled"))
end, {})

vim.lsp.config('beancount', {
    init_options = {
        journal_file = vim.fn.expand("~/projects/ledger/main.bean")
    }
})

vim.filetype.add({
    extension = {
        bean = 'beancount',
    }
})

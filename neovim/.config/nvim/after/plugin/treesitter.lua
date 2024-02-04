local nvim_treesitter = require('nvim-treesitter.configs')

nvim_treesitter.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python" },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    modules = {},
    ignore_install = {},
})

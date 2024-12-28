local tabout = require("tabout")

tabout.setup({
    tabkey = "",
    backwards_tabkey = "",
    completion = false,
    tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = '`', close = '`' },
        { open = '(', close = ')' },
        { open = '[', close = ']' },
        { open = '{', close = '}' },
        { open = '<', close = '>' },
        { open = '#', close = ']' },
        { open = '|', close = '|' },
    },
})

vim.api.nvim_set_keymap("i", "<Tab>", "<Plug>(TaboutMulti)", { silent = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "<Plug>(TaboutBackMulti)", { silent = true })

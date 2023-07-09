local navigator = require('Navigator')

navigator.setup()

vim.keymap.set({ 'n', 't' }, '<C-h>', navigator.left)
vim.keymap.set({ 'n', 't' }, '<C-l>', navigator.right)
vim.keymap.set({ 'n', 't' }, '<C-k>', navigator.up)
vim.keymap.set({ 'n', 't' }, '<C-j>', navigator.down)

-- https://www.reddit.com/r/neovim/comments/ud2w4k/how_to_remap_netrw_to_n_in_keybindingsinitlua/
vim.api.nvim_create_autocmd('filetype', {
    pattern = 'netrw',
    desc = 'Better mappings for netrw',
    callback = function()
        local bind = function(lhs, rhs)
            vim.keymap.set('n', lhs, rhs, { remap = true, buffer = true })
        end

        bind('<C-h>', navigator.left)
        bind('<C-l>', navigator.right)
        bind('<C-k>', navigator.up)
        bind('<C-j>', navigator.down)

        -- edit new file
        bind('n', '%')

        -- rename file
        bind('r', 'R')
    end
})

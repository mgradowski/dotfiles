vim.g.suda_smart_edit = 0

vim.keymap.set('n', '<leader>wr', function()
    vim.cmd [[ SudaWrite ]]
end)

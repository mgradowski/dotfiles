require('mini.files').setup()

vim.keymap.set("n", "<leader>pv", function()
    MiniFiles.open()
end)

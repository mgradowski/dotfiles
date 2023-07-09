-- Toggle fugitive
vim.keymap.set("n", "<leader>gs", function()
    local bufname = vim.fn.bufname('fugitive:///*')
    if vim.fn.buflisted(bufname) ~= 0 then
        vim.cmd [[execute ":bdelete" bufname('fugitive:///*')]]
    else
        if vim.fn.FugitiveHead() ~= '' then
            vim.cmd [[
                Git
            ]]
        end
    end
end)

vim.keymap.set("n", "<leader>gf", function()
    vim.cmd [[ Git fetch ]]
end)

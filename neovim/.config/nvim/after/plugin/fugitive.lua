-- Toggle fugitive
vim.keymap.set("n", "<leader>gs", function()
    local bufname = vim.fn.bufname('fugitive:///*/.git//$')
    if vim.fn.buflisted(bufname) ~= 0 then
        vim.cmd [[execute ":bdelete" bufname('fugitive:///*/.git//$')]]
    else
        vim.cmd.Git()
    end
end)

vim.keymap.set("n", "<leader>gf", function()
    vim.cmd [[ Git fetch ]]
end)

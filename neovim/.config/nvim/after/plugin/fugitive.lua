local minifiles = require("mini.files")

-- Toggle fugitive
vim.keymap.set("n", "<leader>gs", function()
    local fugitive_bufnr = nil

    -- Find the buffer number of the fugitive buffer
    ---@diagnostic disable-next-line: param-type-mismatch
    for bufnr = 1, vim.fn.bufnr("$") do
        if vim.fn.bufname(bufnr):find('fugitive://') then
            fugitive_bufnr = bufnr
            break
        end
    end

    -- If the fugitive buffer is listed, delete it. Otherwise, open it.
    if fugitive_bufnr and vim.fn.buflisted(fugitive_bufnr) ~= 0 then
        vim.cmd [[execute ":bdelete" bufname('fugitive:///*')]]
    else
        if vim.fn.FugitiveHead() ~= '' then
            minifiles.close()

            vim.cmd [[
                Git
            ]]
        end
    end
end)

vim.keymap.set("n", "<leader>gf", function()
    vim.cmd [[ Git fetch ]]
end)

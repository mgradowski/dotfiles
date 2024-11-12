local function insert_date()
    local buf = 0;
    local previous_line = vim.fn.line('.') - 1
    local strict_indexing = false

    vim.api.nvim_buf_set_lines(
        buf,
        previous_line,
        previous_line,
        strict_indexing,
        { "[" .. os.date("%Y-%m-%d %H:%M") .. "]" }
    )
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "vimwiki",
    callback = function()
        vim.keymap.set('n', '<Leader>d', insert_date, { buffer = true, noremap = true, silent = true })
    end,
})

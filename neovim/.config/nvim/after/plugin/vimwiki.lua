local function insert_date()
    local buf = 0;
    local current_line = vim.fn.line('.')
    local previous_line = current_line - 1
    local strict_indexing = false

    vim.api.nvim_buf_set_lines(
        buf,
        previous_line,
        previous_line,
        strict_indexing,
        {
            tostring(os.date("%Y-%m-%d %H:%M")),
            '',
        }
    )

    vim.cmd([[ execute "normal ]] .. current_line .. [[gggcc\<C-o>" ]]);
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "vimwiki",
    callback = function(event)
        vim.keymap.set('n', '<Leader>d', insert_date, { buffer = event.bufnr, noremap = true, silent = true })
    end,
})

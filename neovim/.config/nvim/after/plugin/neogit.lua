local minifiles = require("mini.files")
local neogit = require("neogit")

neogit.setup({})

-- Toggle Neogit
vim.keymap.set("n", "<leader>gs", function()
    local neogit_bufnr = nil

    -- Find the buffer number of the Neogit buffer
    ---@diagnostic disable-next-line: param-type-mismatch
    for bufnr = 1, vim.fn.bufnr("$") do
        if vim.fn.bufname(bufnr):find("NeogitStatus") then
            neogit_bufnr = bufnr
            break
        end
    end

    -- If the fugitive buffer is listed, delete it. Otherwise, open it.
    if neogit_bufnr then
        vim.cmd [[ execute ":bdelete" bufname('fugitive:///*') ]]
    else
        minifiles.close()
        vim.cmd [[ Neogit ]]
    end
end)

vim.keymap.set("n", "<leader>gf", function()
    vim.cmd [[ !git fetch ]]
end)

vim.keymap.set("n", "<leader>gp", function()
    vim.cmd [[ !git pull --autostash --rebase ]]
end)

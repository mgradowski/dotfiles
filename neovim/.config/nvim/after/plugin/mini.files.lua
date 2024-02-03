local minifiles = require("mini.files")

minifiles.setup({
    content = {
        prefix = function() end,
    }
})

vim.keymap.set("n", "<leader>pv", function()
    if not minifiles.close() then
        minifiles.open(vim.api.nvim_buf_get_name(0))
    end
end)

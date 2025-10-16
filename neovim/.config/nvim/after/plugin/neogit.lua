local minifiles = require("mini.files")
local neogit = require("neogit")

neogit.setup({})

vim.keymap.set("n", "<leader>gs", function()
    minifiles.close()
    vim.cmd [[ Neogit ]]
end)

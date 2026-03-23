local comment = require('Comment')
comment.setup()


--  alacritty workaround
vim.keymap.set("n", "<C-_>", "gcc", { remap = true })
vim.keymap.set("v", "<C-_>", "gcgv", { remap = true })

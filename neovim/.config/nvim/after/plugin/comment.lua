local comment = require('Comment')
comment.setup()


if vim.g.neovide then
    vim.keymap.set("n", "<C-/>", "gcc", { remap = true })
    vim.keymap.set("v", "<C-/>", "gcgv", { remap = true })
else
    --  alacritty workaround
    vim.keymap.set("n", "<C-_>", "gcc", { remap = true })
    vim.keymap.set("v", "<C-_>", "gcgv", { remap = true })
end

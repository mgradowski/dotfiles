vim.g.mapleader = " "

-- Move whole lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Don't exit visual mode on indent
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Keep cursor position after joining the next line
vim.keymap.set("n", "J", "mzJ`z")

-- Move vertically by visual line (easier navigation around wrapped lines)
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "j", "gj")

-- Easier jumping to start/end of the line
vim.keymap.set("n", "E", "$")
vim.keymap.set("n", "B", "^")

-- Keep paste buffer after overwrite
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Keep paste buffer after delete
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Yank to system clipboard using Space+y
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Defy the muscle memory
vim.cmd("cabb q silent! close")
vim.cmd("cabb wq write<bar>silent! close")

-- Replace the word under the cursor across the current buffer
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Jump buffer forward
vim.keymap.set("n", "<leader><C-o>", "<C-i>")

-- tabout replacement developed at CERN (element number 119)
vim.keymap.set("i", "<C-b>", "<Left>")
vim.keymap.set("i", "<C-f>", "<Right>")

-- Diagnostics
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)


if vim.g.neovide then
    vim.keymap.set('n', '<D-s>', ':w<CR>')      -- Save
    vim.keymap.set('v', '<D-c>', '"+y')         -- Copy
    vim.keymap.set('n', '<D-v>', '"+P')         -- Paste normal mode
    vim.keymap.set('v', '<D-v>', '"+P')         -- Paste visual mode
    vim.keymap.set('c', '<D-v>', '<C-R>+')      -- Paste command mode
    vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode


    -- stupid place to keep this but whatever
    local _initial_initial_scale_factor = 0.9
    vim.g.neovide_scale_factor = _initial_initial_scale_factor

    vim.keymap.set({ "n", "v", "i" }, "<D-+>",
        function()
            vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.025
        end)
    vim.keymap.set({ "n", "v", "i" }, "<D-->",
        function()
            vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.025
        end)
    vim.keymap.set({ "n", "v", "i" }, "<D-0>",
        function()
            vim.g.neovide_scale_factor = _initial_initial_scale_factor
        end)
end

vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })

vim.keymap.set('c', '<C-f>', '<Nop>') -- Paste command mode

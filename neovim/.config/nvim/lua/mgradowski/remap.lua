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

-- tmux sesionizer on Ctrl+f
vim.keymap.set("n", "<C-b>", "<cmd>silent !tmux neww fish -c tmux_sessionizer<CR>")

-- git graph
vim.keymap.set("n", "<leader>gg", "<cmd>silent !tmux neww git g<CR>")
vim.keymap.set("n", "<leader>ga", "<cmd>silent !tmux neww git ga<CR>")

-- Jump buffer forward
vim.keymap.set("n", "<leader><C-o>", "<C-i>")

-- tabout replacement developed at CERN (element number 119)
vim.keymap.set("i", "<C-b>", "<Left>")
vim.keymap.set("i", "<C-f>", "<Right>")

-- Diagnostics
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

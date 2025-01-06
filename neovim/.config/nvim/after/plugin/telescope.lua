local telescope = require("telescope")
local minifiles = require("mini.files")
local builtin = require('telescope.builtin')

telescope.setup {
    pickers = {
        find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            -- find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
            additional_args = function(_)
                return { "--hidden", "--glob", "!**/.git/*" }
            end
        },
        live_grep = {
            additional_args = function(_)
                return { "--hidden", "--glob", "!**/.git/*" }
            end
        }
    },

    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    },
}

telescope.load_extension("fzf")
telescope.load_extension("dap")

vim.keymap.set('n', '<leader>ps', function()
    minifiles.close()
    builtin.live_grep({
        file_encoding = "auto",
    })
end, {})
vim.keymap.set('n', '<C-p>', function()
    minifiles.close()
    builtin.git_files()
end, {})
vim.keymap.set('n', '<leader>pf', function()
    minifiles.close()
    builtin.find_files()
end, {})
vim.keymap.set('n', '<leader>gb', function()
    minifiles.close()
    builtin.git_branches()
end, {})
vim.keymap.set('n', '<leader>gc', function()
    minifiles.close()
    builtin.git_commits()
end, {})
vim.keymap.set('n', '<leader>:', function()
    minifiles.close()
    builtin.commands()
end, {})
vim.keymap.set('n', '<leader>k', function()
    minifiles.close()
    builtin.keymaps()
end, {})
vim.keymap.set('n', '<leader>ds', function()
    minifiles.close()
    telescope.extensions.dap.frames()
end, {})

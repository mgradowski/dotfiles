local telescope = require("telescope")
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
	}
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

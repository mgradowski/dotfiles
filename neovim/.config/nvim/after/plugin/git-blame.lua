vim.g.gitblame_virtual_text_column = 80
vim.g.gitblame_date_format = "%r"
vim.g.gitblame_message_template = ' <author> • <date> • <summary>' .. string.rep(" ", 100)
vim.g.gitblame_message_when_not_committed = ' Uncommited' .. string.rep(" ", 100)

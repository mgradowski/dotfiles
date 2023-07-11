local lualine = require('lualine')
local theme1 = require('lualine.themes.base16')

theme1.command.a.fg = theme1.command.a.bg
theme1.command.a.bg = "none"
theme1.command.b.bg = "none"
theme1.command.c.bg = "none"

theme1.insert.a.fg = theme1.insert.a.bg
theme1.insert.a.bg = "none"
theme1.insert.b.bg = "none"

theme1.normal.a.bold = "bold"
theme1.normal.a.fg = theme1.normal.a.bg
theme1.normal.a.bg = "none"
theme1.normal.b.bg = "none"
theme1.normal.c.bg = "none"

theme1.replace.a.fg = theme1.replace.a.bg
theme1.replace.a.bg = "none"
theme1.replace.b.bg = "none"

theme1.visual.a.fg = theme1.visual.a.bg
theme1.visual.a.bg = "none"
theme1.visual.b.bg = "none"

lualine.setup({
    options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
        theme = theme1,
    },
    sections = {
        lualine_b = {
            {
                'branch',
                icon = '',
            },
            {
                'diff',
            },
        },
        lualine_c = {
            {
                'filename',
                path = 1,
            },
        },
        lualine_x = {
            {
                'diagnostics',
                always_visible = true,
                symbols = { error = '', warn = '', info = '', hint = '' },
                update_in_insert = true,
            },
        },
        lualine_y = {
            'encoding',
            'filetype',
            'location',
        },
        lualine_z = {},
    }
})

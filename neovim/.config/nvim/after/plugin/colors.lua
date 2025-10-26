if vim.g.neovide then
    vim.cmd.colorscheme("tokyonight")
    return
end

local function extend_hl(ns_id, name, val)
    local old = vim.api.nvim_get_hl(ns_id, { name = name })
    local new = vim.tbl_extend('force', old, val)
    vim.api.nvim_set_hl(ns_id, name, new)
end

function DeezColorz(color)
    color = color or "default"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Visual", { reverse = true })

    vim.api.nvim_set_hl(0, "NonText", { ctermfg = 8 })
    vim.api.nvim_set_hl(0, "VimwikiCode", { ctermfg = 2 })

    vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { ctermfg = 8 })
    -- vim.api.nvim_set_hl(0, "IndentBlanklineChar", { ctermfg = 247 })

    extend_hl(0, "DiffAdd", { ctermbg = "none", ctermfg = 2, bold = true })
    extend_hl(0, "DiffChange", { ctermfg = 11, bold = true })
    extend_hl(0, "DiffDelete", { ctermfg = 9, bold = true })

    vim.api.nvim_set_hl(0, "LineNrAbove", { ctermfg = 8, bold = false })
    vim.api.nvim_set_hl(0, "LineNrBelow", { link = "LineNrAbove" })
    vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "LineNrAbove" })

    vim.api.nvim_set_hl(0, "Cursorline", { ctermbg = 233 })
    vim.api.nvim_set_hl(0, 'WinSeparator', { ctermfg = 6 })
    vim.api.nvim_set_hl(0, 'Comment', { ctermfg = 8 })
end

DeezColorz()

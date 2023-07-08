function DeezColorz(color)
    color = color or "dracula-soft"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { fg = "#3A444F" })
    vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#3A444F" })
end

DeezColorz()

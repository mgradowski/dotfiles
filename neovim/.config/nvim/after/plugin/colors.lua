function DeezColorz(color)
    color = color or "dracula-soft"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { fg = "#3A444F" })
    vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#3A444F" })
    vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#3A444F" })
    vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#87e58e" })
    vim.api.nvim_set_hl(0, "Cursorline", { bg = "#313131" })
end

DeezColorz()

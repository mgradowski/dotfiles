local dap = require('dap')
local dapui = require('dapui')
local mason_nvim_dap = require("mason-nvim-dap")

mason_nvim_dap.setup({
    ensure_installed = { 'python' },
    automatic_installation = false,
    handlers = {
        function(config)
            mason_nvim_dap.default_setup(config)
        end,

        python = function(config)
            -- Don't hide library stack frames.
            config.configurations[1].justMyCode = false

            mason_nvim_dap.default_setup(config)
        end,
    },
})

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end

vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint)

vim.keymap.set('n', '<Leader>dd', dapui.toggle)

local luasnip = require("luasnip")
local cmp = require('cmp')


vim.keymap.set({ "i", "c", "s" }, "<C-n>",
    function()
        if luasnip.in_snippet() and luasnip.jump(1) then
            return
        end
        if cmp.select_next_item({ behavior = 'insert' }) then
            return
        end
        if cmp.complete() then
            return
        end
    end
)

vim.keymap.set({ "i", "c", "s" }, "<C-p>",
    function()
        if luasnip.in_snippet() and luasnip.jump(-1) then
            return
        end
        if cmp.select_prev_item({ behavior = 'insert' }) then
            return
        end
    end
)

vim.keymap.set({ "i", "c" }, "<C-k>",
    function()
        if cmp.visible() then
            cmp.confirm({ select = true })
        else
            cmp.complete()
        end
    end
)


cmp.setup.cmdline({ '/', '?' }, {
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'calc' },
        { name = 'cmdline' },
    }),
    ---@diagnostic disable-next-line: missing-fields
    matching = { disallow_symbol_nonprefix_matching = false },
})


cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip", option = { use_show_condition = false } },
        { name = "calc" },
        { name = "buffer" },
        { name = "path" },
        { name = "tmux",    option = { all_panes = true, capture_history = true, } },
    },

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },

})

require("luasnip.loaders.from_vscode").lazy_load()

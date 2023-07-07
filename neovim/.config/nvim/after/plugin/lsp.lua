local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	"jsonls",
	"lua_ls",
	"pyright",
	"tsserver",
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
	['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
	['<C-y>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup()


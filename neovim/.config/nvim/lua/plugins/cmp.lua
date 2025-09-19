return {
    "andersevenrud/cmp-tmux",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    'hrsh7th/cmp-cmdline',
    {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "v2.*",
        build = "make install_jsregexp",
    },
    'saadparwaiz1/cmp_luasnip',
}

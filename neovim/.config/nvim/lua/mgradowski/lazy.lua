local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    { 'Mofiqul/dracula.nvim' },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    { 'numToStr/Navigator.nvim' },

    { "williamboman/mason.nvim" },

    { "williamboman/mason-lspconfig.nvim" },

    { 'neovim/nvim-lspconfig' },

    { 'hrsh7th/cmp-nvim-lsp' },

    { 'hrsh7th/nvim-cmp' },

    { "rafamadriz/friendly-snippets" },

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
    },

    { 'saadparwaiz1/cmp_luasnip' },

    { 'jose-elias-alvarez/null-ls.nvim' },

    { 'jay-babu/mason-null-ls.nvim' },

    { 'nvim-treesitter/nvim-treesitter-context' },

    { "lukas-reineke/virt-column.nvim" },

    { 'f-person/git-blame.nvim' },

    { 'numToStr/Comment.nvim' },

    { 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git' },

    { 'windwp/nvim-autopairs' },

    { "lukas-reineke/indent-blankline.nvim" },

    { 'mhinz/vim-signify' },

    { 'nvim-lualine/lualine.nvim' },

    { 'vimwiki/vimwiki' },

    {
        'echasnovski/mini.files',
        version = '*'
    },

    {
        'echasnovski/mini.cursorword',
        version = '*'
    },

    {
        'lambdalisue/suda.vim',
    },

    { 'folke/neodev.nvim' },

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        }
    },

    { "kylechui/nvim-surround" },

    { "abecodes/tabout.nvim" },

})

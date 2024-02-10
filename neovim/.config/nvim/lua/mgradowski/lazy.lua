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
        tag = '0.1.2',
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

    { 'tpope/vim-fugitive' },

    { "williamboman/mason.nvim" },

    { "williamboman/mason-lspconfig.nvim" },

    { 'neovim/nvim-lspconfig' },

    { 'hrsh7th/cmp-nvim-lsp' },

    { 'hrsh7th/nvim-cmp' },

    { 'L3MON4D3/LuaSnip' },

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
        'echasnovski/mini.animate',
        version = '*'
    },

    {
        'echasnovski/mini.cursorword',
        version = '*'
    },

    {
        'lambdalisue/suda.vim',
        init = function()
            vim.g.suda_smart_edit = 0
        end
    },

    { 'folke/neodev.nvim' },

    -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
})

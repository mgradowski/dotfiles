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
        requires = { { 'nvim-lua/plenary.nvim' } }
    },

    { 'Mofiqul/dracula.nvim' },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    { 'nvim-lua/plenary.nvim' },

    { 'ThePrimeagen/harpoon' },

    { 'mbbill/undotree' },

    { 'numToStr/Navigator.nvim' },

    { 'tpope/vim-fugitive' },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x'
    },

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

    { 'towolf/vim-helm' },

    { 'vimwiki/vimwiki' }
})

return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        dir = "~/projects/neogit/",
    },
    "abecodes/tabout.nvim",
    {
        'echasnovski/mini.cursorword',
        version = '*'
    },
    {
        'echasnovski/mini.files',
        version = '*'
    },
    "kamalsacranie/nvim-mapper",
    "kylechui/nvim-surround",
    "lukas-reineke/indent-blankline.nvim",
    "lukas-reineke/virt-column.nvim",
    'Mofiqul/dracula.nvim',
    'ThePrimeagen/harpoon',
    'f-person/git-blame.nvim',
    'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git',
    'lambdalisue/suda.vim',
    'mhinz/vim-signify',
    'numToStr/Comment.nvim',
    'numToStr/Navigator.nvim',
    'nvim-lualine/lualine.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-dap.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    'nvim-treesitter/nvim-treesitter-context',
    'vimwiki/vimwiki',
    'windwp/nvim-autopairs',
    'codethread/qmk.nvim'
}

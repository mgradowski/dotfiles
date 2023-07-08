vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'Mofiqul/dracula.nvim'

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use 'nvim-treesitter/playground'

    use 'ThePrimeagen/harpoon'

    use 'mbbill/undotree'

    use 'numToStr/Navigator.nvim'

    use 'tpope/vim-fugitive'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    ---@diagnostic disable-next-line: param-type-mismatch
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use 'jose-elias-alvarez/null-ls.nvim'

    use 'jay-babu/mason-null-ls.nvim'

    use 'nvim-treesitter/nvim-treesitter-context'

    use "lukas-reineke/virt-column.nvim"
end)

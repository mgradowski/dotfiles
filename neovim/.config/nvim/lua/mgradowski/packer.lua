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

    use 'f-person/git-blame.nvim'

    use 'numToStr/Comment.nvim'

    use 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git'

    use 'windwp/nvim-autopairs'

    use "lukas-reineke/indent-blankline.nvim"

    use {
        'abecodes/tabout.nvim',
        config = function()
            require('tabout').setup {
                act_as_tab = true,           -- shift content if tab out is not possible
                act_as_shift_tab = false,    -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = '<C-t>',       -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = '<C-d>', -- reverse shift default action,
                enable_backwards = true,     -- well ...
                completion = false,          -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' }
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            }
            vim.api.nvim_set_keymap('i', '<Tab>', "<Plug>(TaboutMulti)", { silent = true })
            vim.api.nvim_set_keymap('i', '<S-Tab>', "<Plug>(TaboutBackMulti)", { silent = true })
        end,
        wants = { 'nvim-treesitter' }, -- or require if not used so far
        after = { 'nvim-cmp' }         -- if a completion plugin is using tabs load it before
    }
end)

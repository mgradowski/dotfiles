vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use 'Mofiqul/dracula.nvim'

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use 'nvim-treesitter/playground'

	use 'ThePrimeagen/harpoon'

	use 'mbbill/undotree'

	use 'numToStr/Navigator.nvim'

	use 'tpope/vim-fugitive'
end)


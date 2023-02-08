-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)

	-- Packer can manage itself

	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- use {
	-- 	'rose-pine/neovim',
	-- 	as = 'rose-pine',
	-- 	config = function()
	-- 		vim.cmd.colorscheme('rose-pine');
	-- 	end
	-- }

	-- Using Packer:
	use 'Mofiqul/dracula.nvim'

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')

	use 'ThePrimeagen/harpoon'

	use 'mbbill/undotree'

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

	use 'feline-nvim/feline.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'

	use 'thePrimeagen/vim-be-good'

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use "terrortylor/nvim-comment"

	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				-- https://github.com/folke/todo-comments.nvim
			}
		end
	}

	use({
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup {
				-- your config goes here
				-- or just leave it empty :)
			}
		end,
	})

	use "kdheepak/lazygit.nvim"

	-- INFO: Configure dashboard
	-- use {'glepnir/dashboard-nvim'}

	use 'github/copilot.vim'

	use 'voldikss/vim-floaterm'
end)

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
     requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({ 'mhartington/oceanic-next' })
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	use { "jiaoshijie/undotree" }
	use {'vim-airline/vim-airline'}
	use {'vim-airline/vim-airline-themes'}
	use {'nvim-lua/plenary.nvim'}
	use {'github/copilot.vim'}
	use {'lewis6991/gitsigns.nvim'}
	use {'xiyaowong/nvim-transparent'}
	use {'preservim/nerdcommenter'}
	use {'mattn/emmet-vim'}
	use {'Raimondi/delimitMate'}
	use {'nvim-tree/nvim-web-devicons'}
	use {'preservim/tagbar'}
	use {'tpope/vim-fugitive'}
	use {'psliwka/vim-smoothie'}
	use {'cljoly/telescope-repo.nvim'}
	use {'famiu/bufdelete.nvim'}
	use {'wakatime/vim-wakatime'}
	use {'luochen1990/rainbow'}
	use {
		"windwp/nvim-autopairs",
			config = function() require("nvim-autopairs").setup {} end
	}
	use {'williamboman/mason.nvim'}
	use {'ThePrimeagen/harpoon'}
	use {'mg979/vim-visual-multi'}
	use {
			'goolord/alpha-nvim',
			requires = { 'nvim-tree/nvim-web-devicons' },
			config = function ()
					require'alpha'.setup(require'alpha.themes.startify'.config)
			end
	}
	use {'folke/persistence.nvim'}
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		}
	}
	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
	use {'johann2357/nvim-smartbufs'}
	use {'kazhala/close-buffers.nvim'}
	use {'christoomey/vim-tmux-navigator'}

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			-- {'williamboman/mason.nvim'},
			-- {'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

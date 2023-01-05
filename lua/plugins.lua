local ok, packer = pcall(require, "packer")
if not ok then
	print("Packer require error.")
end

packer.startup({
	function(use)
		use("wbthomason/packer.nvim")

		use({
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		})

		use("windwp/nvim-autopairs")

		use({
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		})

		use("EdenEast/nightfox.nvim")

		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
		})

		-- Telescope extensions
		use({
			"ghassan0/telescope-glyph.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		})

		use("nvim-treesitter/nvim-treesitter")

		use("lewis6991/gitsigns.nvim")

		use("tamton-aquib/staline.nvim")

		use("folke/neodev.nvim")

		use("rcarriga/nvim-notify")

		use("nvim-tree/nvim-web-devicons")

		use("onsails/lspkind.nvim")

		use({
			"jackMort/ChatGPT.nvim",
			requires = "MunifTanjim/nui.nvim",
		})

		use("jose-elias-alvarez/null-ls.nvim")

		use("jayp0521/mason-null-ls.nvim")
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

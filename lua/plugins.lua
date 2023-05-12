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

local ok, lazy = pcall(require, "lazy")

if not ok then
	print("[Plugins] lazy import error.")
end

local plugins = {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
	"windwp/nvim-autopairs",

	-- Completion engine
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	-- Themes
	"EdenEast/nightfox.nvim",
	-- Telescope extensions
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } } },
	},
	"nvim-telescope/telescope-project.nvim",
	"cljoly/telescope-repo.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"lewis6991/gitsigns.nvim",
	{
		"tamton-aquib/staline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"folke/neodev.nvim",
	"rcarriga/nvim-notify",
	"onsails/lspkind.nvim",
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"jayp0521/mason-null-ls.nvim",
	"numToStr/Comment.nvim",
	"norcalli/nvim-colorizer.lua",
	"windwp/nvim-ts-autotag",
	"glepnir/lspsaga.nvim",
	"folke/tokyonight.nvim",
	"iamcco/markdown-preview.nvim",
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
	},
	"voldikss/vim-floaterm",
	"prisma/vim-prisma",
}

local opts = {}

lazy.setup(plugins, opts)

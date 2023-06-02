local ok, nightfox = pcall(require, "nightfox")
if not ok then
	print("[Theme] nightfox require error.")
end

local ok, tokyonight = pcall(require, "tokyonight")
if not ok then
	print("[Theme] tokyonight require error.")
end

nightfox.setup({
	options = {
		transparent = false,
		terminal_colors = true,
		styles = {
			comments = "italic",
			conditionals = "",
			constants = "italic,bold",
			functions = "",
			keywords = "bold",
			numbers = "",
			operators = "",
			strings = "",
			types = "",
			variables = "",
		},
	},
})

tokyonight.setup({
	style = "moon",
	transparent = false,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = "dark",
		floats = "normal",
	},
})

vim.cmd("colorscheme tokyonight-night")

local ok, nightfox = pcall(require, "nightfox")
if not ok then
	print("[Theme] nightfox require error.")
end

nightfox.setup({
	options = {
		transparent = true,
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

vim.cmd("colorscheme nightfox")

local ok, saga = pcall(require, "lspsaga")
if not ok then
	print("[Saga] plugin require error.")
end

saga.setup({
	lightbulb = {
		enable = false,
		enable_on_insert = false,
	},
	ui = {
		theme = "round",
		border = "rounded",
		windblend = 0,
	},
})

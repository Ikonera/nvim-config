local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	print("[Treesitter] plugin require error.")
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	ensure_installed = {
		"lua",
		"typescript",
		"tsx",
		"javascript",
		"json",
		"yaml",
		"dockerfile",
	},
	auto_install = true,
})

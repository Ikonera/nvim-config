local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	print("[Treesitter] plugin require error.")
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
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
		"bash",
		"python",
	},
	auto_install = false,
})

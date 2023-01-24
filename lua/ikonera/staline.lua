local ok, staline = pcall(require, "staline")
if not ok then
	print("[Staline] plugin require error")
end

staline.setup({
	sections = {
		left = { "- ", "-mode", "left_sep_double", "lsp", "branch" },
	},
})

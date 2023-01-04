local ok, null_ls = pcall(require, "null-ls")
if not ok then
	print("[Formatter] plugin require error.")
end

null_ls.setup({
	sources = { null_ls.builtins.formatting.prettierd }
})

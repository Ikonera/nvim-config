local ok, null_ls = pcall(require, "null-ls")
if not ok then
	print("[Formatter] plugin require error.")
end

local ok, mason_null_ls = pcall(require, "mason-null-ls")
if not ok then
	print("[Formatter] mason-null-ls require error.")
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

mason_null_ls.setup({
	ensure_installed = {
		"prettierd",
		"stylua",
	},
})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

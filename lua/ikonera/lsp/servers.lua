local ok, mason = pcall(require, "mason")
if not ok then
	print("[LSP] mason require error.")
end

local ok, masonlsp = pcall(require, "mason-lspconfig")
if not ok then
	print("[LSP] mason-lspconfig require error.")
end

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	print("[LSP] lspconfig require error.")
end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
	print("[LSP] cmp-nvim-lsp require error.")
end

local capabilities = cmp_nvim_lsp.default_capabilities()

mason.setup({
	ui = {
		height = 0.8,
		width = 140,
		icons = {
			package_installed = "",
			package_uninstalled = "",
			package_pending = "",
		},
	},
	pip = {
		upgrade_pip = true,
	},
})

masonlsp.setup({
	ensure_installed = {
		"lua_ls",
		"tsserver",
		"yamlls",
		"jsonls",
		"zk",
		"html",
		"emmet_ls",
		"dockerls",
		"bashls",
		"prismals",
		"pyright",
		"pylsp",
	},
	automatic_installation = false,
})

-- Servers setup

for _, server in ipairs(masonlsp.get_installed_servers()) do
	if server == "lua_ls" then
		lspconfig[server].setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})
	elseif server == "tsserver" then
		lspconfig[server].setup({
			capabilities = capabilities,
		})
	elseif server == "yamlls" then
		lspconfig[server].setup({
			capabilities = capabilities,
			settings = {
				yaml = {
					schemas = { kubernetes = "*.kube.yaml" },
				},
			},
		})
	elseif server == "emmet_ls" then
		lspconfig[server].setup({
			capabilities = capabilities,
			filetypes = {
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
				"html",
				"css",
				"sass",
				"scss",
			},
		})
	else
		lspconfig[server].setup({
			capabilities = capabilities,
		})
	end
end

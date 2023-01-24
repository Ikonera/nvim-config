local ok, nvim_cmp = pcall(require, "cmp")
if not ok then
	print("[Completion] nvim-cmp require error.")
end

local ok, luasnip = pcall(require, "luasnip")
if not ok then
	print("[Completion] nvim-cmp require error.")
end

local ok, devicons = pcall(require, "nvim-web-devicons")
if not ok then
	print("[Completion] devicons require error.")
end

local ok, lspkind = pcall(require, "lspkind")
if not ok then
	print("[Completion] lspkind require error.")
end

local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not ok then
	print("[Completion] nvim-autopairs require error.")
end

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

nvim_cmp.setup({
	window = {
		completion = nvim_cmp.config.window.bordered(),
		documentation = nvim_cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			if vim.tbl_contains({ "path" }, entry.source.name) then
				local icon, hl_group = devicons.get_icon(entry:get_completion_item().label)
				if icon then
					vim_item.kind = icon
					vim_item.kind_hl_group = hl_group
					return vim_item
				end
			end
			return lspkind.cmp_format({
				with_text = true,
				mode = "symbol_text",
			})(entry, vim_item)
		end,
	},
	mapping = nvim_cmp.mapping.preset.insert({
		["<C-b>"] = nvim_cmp.mapping.scroll_docs(-4),
		["<C-f>"] = nvim_cmp.mapping.scroll_docs(4),
		["<C-Space>"] = nvim_cmp.mapping.complete(),
		["<C-e>"] = nvim_cmp.mapping.abort(),
		["<CR>"] = nvim_cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = nvim_cmp.mapping(function(fallback)
			if nvim_cmp.visible() then
				nvim_cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				nvim_cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = nvim_cmp.mapping(function(fallback)
			if nvim_cmp.visible() then
				nvim_cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = nvim_cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

nvim_cmp.setup.cmdline({ "/", "?" }, {
	mapping = nvim_cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

nvim_cmp.setup.cmdline(":", {
	mapping = nvim_cmp.mapping.preset.cmdline(),
	sources = nvim_cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

nvim_cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

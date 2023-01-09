local ok, telescope = pcall(require, "telescope")
if not ok then
	print("[Telescope] plugin require error.")
end

local ok, t_actions = pcall(require, "telescope.actions")
if not ok then
	print("[Telescope] actions-state require error.")
end

local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
	defaults = {
		sorting_strategy = "ascending",
		selection_caret = " ",
		dynamic_preview_title = true,
		file_ignore_patterns = {
			".git/",
			"node_modules/",
			".yarn/cache/",
			".next/",
			"build/",
		},
	},
	pickers = {
		find_files = {
			prompt_prefix = "$ ",
			results_title = "Found files",
			prompt_title = "What are you searching for ?",
		},
		live_grep = {
			prompt_prefix = "  ",
		},
		buffers = {
			mappings = {
				n = {
					d = t_actions.delete_buffer,
				},
			},
		},
	},
	extensions = {
		file_browser = {
			initial_mode = "normal",
			mappings = {
				n = {
					r = fb_actions.rename,
					["~"] = fb_actions.goto_home_dir,
				},
				i = {
					["<CR>"] = fb_actions.create_from_prompt,
				},
			},
		},
	},
})

telescope.load_extension("glyph")
telescope.load_extension("file_browser")

local ok, telescope = pcall(require, "telescope")
if not ok then
  print("[Telescope] plugin require error.")
end

local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    selection_caret = " "
  },
  pickers = {
    find_files = {
      prompt_prefix = "$ ",
    },
    live_grep = {
      prompt_prefix = "  "
    }
  },
  extensions = {
    file_browser = {
      initial_mode = "normal",
      mappings = {
        n = {
          r = fb_actions.rename,
	        p = fb_actions.create_from_prompt,
          ['~'] = fb_actions.goto_home_dir,
        }
      }
    }
  }
})

telescope.load_extension("glyph")
telescope.load_extension("file_browser")

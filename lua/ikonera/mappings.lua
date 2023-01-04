local nkey = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true, nowait = true }

  -- basic keymaps

nkey('n', "<space>w", ":w<CR>", opts)
nkey('n', "<space>q", ":x<CR>", opts)
nkey('n', "<space>d", ":bd<CR>", opts)
nkey('n', "<space>c", ":clo<CR>", opts)
nkey('n', "<space>t", ":term<CR>", opts)
nkey('n', "<space>lg", ":term lazygit<CR>", opts)
nkey('n', "<space>ld", ":term lazydocker<CR>", opts)

  -- telescope

nkey('n', "ff", ":Telescope find_files hidden=true<CR>", opts)
nkey('n', "fb", ":Telescope buffers<CR>", opts)
nkey('n', "fg", ":Telescope live_grep<CR>", opts)
nkey('n', "fn", ":Telescope file_browser<CR>", opts)

  -- Lspsaga

nkey('n', "gd", ":Lspsaga peek_definition<CR>", opts)
nkey('n', "gf", ":Lspsaga lsp_finder<CR>", opts)
nkey('n', "gh", ":Lspsaga hover_doc<CR>", opts)
nkey('n', "ga", ":Lspsaga code_action<CR>", opts)
nkey('n', "R", ":Lspsaga rename<CR>", opts)
nkey('n', "[", ":Lspsaga diagnostic_jump_prev<CR>", opts)
nkey('n', "]", ":Lspsaga diagnostic_jump_next<CR>", opts)

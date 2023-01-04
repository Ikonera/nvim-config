local ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not ok then
  print("[Autopairs] plugin require error.")
end

nvim_autopairs.setup({
  disable_filtypes = {"TelescopePrompt", "vim"}
})

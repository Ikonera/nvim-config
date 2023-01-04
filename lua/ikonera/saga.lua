local ok, saga = pcall(require, "lspsaga")
if not ok then
  print("[Saga] plugin require error.")
end

saga.init_lsp_saga({
  code_action_lightbulb = {
    enable = false,
  },
  border_style = "rounded",
  saga_winblend = 0,
})

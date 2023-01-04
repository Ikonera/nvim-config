local ok, _ = pcall(require, "ikonera.lsp.servers")
if not ok then
  print("[LSP] servers require error.")
end

local ok, _ = pcall(require, "ikonera.lsp.completion")
if not ok then
  print("[LSP] completion require error.")
end

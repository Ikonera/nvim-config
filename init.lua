local ok, _ = pcall(require, "plugins")
if not ok then
  print("[Init] plugins import error.")
end

local ok, _ = pcall(require, "ikonera.mappings")
if not ok then
  print("[Init] mappings import error.")
end

local ok, _ = pcall(require, "config")
if not ok then
  print("[Init] config import error.")
end

local ok, _ = pcall(require, "ikonera.lsp")
if not ok then
  print("[Init] lsp import error.")
end

local ok, _ = pcall(require, "ikonera.theme")
if not ok then
  print("[Init] theme import error.")
end

local ok, _ = pcall(require, "ikonera.telescope")
if not ok then
  print("[Init] telescope import error.")
end

local ok, _ = pcall(require, "ikonera.autopairs")
if not ok then
  print("[Init] autopairs import error.")
end

local ok, _ = pcall(require, "ikonera.gitsigns")
if not ok then
  print("[Init] gitsigns import error.")
end

local ok, _ = pcall(require, "ikonera.treesitter")
if not ok then
  print("[Init] treesitter import error.")
end

local ok, _ = pcall(require, "ikonera.staline")
if not ok then
  print("[Init] staline import error.")
end

local ok, _ = pcall(require, "ikonera.neodev")
if not ok then
  print("[Init] neodev import error.")
end

local ok, _ = pcall(require, "ikonera.notify")
if not ok then
  print("[Init] notify import error.")
end

local ok, _ = pcall(require, "ikonera.chatgpt")
if not ok then
  print("[Init] chatgpt import error.")
end

local ok, _ = pcall(require, "ikonera.formatter")
if not ok then
  print("[Init] formatter import error.")
end

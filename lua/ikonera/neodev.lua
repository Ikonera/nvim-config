local ok, neodev = pcall(require, "neodev")
if not ok then
  print("[Neodev] plugin require error.")
end

neodev.setup()

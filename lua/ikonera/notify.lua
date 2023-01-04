local ok, notify = pcall(require, "notify")
if not ok then
  print("[Notify] plugin require error.")
end

notify.setup()

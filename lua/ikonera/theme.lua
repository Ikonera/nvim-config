local ok, nightfox = pcall(require, "nightfox")
if not ok then
  print("[Theme] nightfox require error.")
end

nightfox.setup({
  options = {
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = "",
      conditionals = "",
      constants = "",
      functions = "",
      keywords = "",
      numbers = "",
      operators = "",
      strings = "",
      types = "",
      variables = ""
    }
  }
})

vim.cmd("colorscheme nightfox")

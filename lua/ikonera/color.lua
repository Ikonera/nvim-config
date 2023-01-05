local ok, color = pcall(require, "colorizer")
if not ok then
	print("[Color] plugin require error.")
end

color.setup()

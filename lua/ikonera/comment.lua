local ok, comment = pcall(require, "Comment")
if not ok then
	print("[Comment] plugin require error.")
end

comment.setup()

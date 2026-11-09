local terminal = "com.superlogical.terminal"
local shell = terminal .. ".shell"

local function foreground_cwd(ctx)
	local process, err = rex.block.call(terminal, "process", { block_id = ctx.block_id })
	if err ~= nil then
		error(err, 0)
	end
	return process.foreground and process.foreground.cwd
end

rex.action({
	name = "lazygit",
	title = "Open Lazygit",
	run = function(ctx)
		local _, err = rex.session.new_layer({
			bounds = { 0.225, 0.2, 0.55, 0.6 },
			focus = true,
			layout = rex.layout.block({
				flavor = shell,
				options = { cwd = foreground_cwd(ctx), command = { "lazygit" } },
			}),
		})
		if err ~= nil then
			error(err, 0)
		end
	end,
})

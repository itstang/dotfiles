local leader = "ctrl+a>"
rex.bind(leader .. "\\", "pane.split", { direction = "right" })
rex.bind(leader .. "-", "pane.split", { direction = "down" })
rex.bind(leader .. "z", "pane.zoom")
rex.bind(leader .. "x", "pane.close")

rex.bind("ctrl+shift+h", "pane.focus.left")
rex.bind("ctrl+shift+j", "pane.focus.down")
rex.bind("ctrl+shift+k", "pane.focus.up")
rex.bind("ctrl+shift+l", "pane.focus.right")

rex.mode("resize", { exclusive = true })
rex.bind("cmd+r", "client.mode.enter", { name = "resize" })
rex.bind("resize/left", "pane.resize", { direction = "left" })
rex.bind("resize/right", "pane.resize", { direction = "right" })
rex.bind("resize/up", "pane.resize", { direction = "up" })
rex.bind("resize/down", "pane.resize", { direction = "down" })

rex.bind("cmd+l", "lazygit")

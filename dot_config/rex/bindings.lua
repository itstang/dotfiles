rex.bind("ctrl+a>\\", "pane.split", { direction = "right" })
rex.bind("ctrl+a>-", "pane.split", { direction = "down" })
rex.bind("ctrl+a>z", "pane.zoom")
rex.bind("ctrl+a>x", "pane.close")

rex.bind("ctrl+shift+h", "pane.focus.left")
rex.bind("ctrl+shift+j", "pane.focus.down")
rex.bind("ctrl+shift+k", "pane.focus.up")
rex.bind("ctrl+shift+l", "pane.focus.right")

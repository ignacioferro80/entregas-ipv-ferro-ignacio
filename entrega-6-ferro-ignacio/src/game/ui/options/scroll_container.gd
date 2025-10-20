extends ScrollContainer

func _process(_delta):
	var vscroll = get_v_scroll_bar()
	if vscroll:
		var grabber = vscroll.get_child(0)  # el nodo interno del grabber
		if grabber and grabber.size.y > 100:
			grabber.size.y = 100

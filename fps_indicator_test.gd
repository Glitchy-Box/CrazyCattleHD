extends Label

var graphicslog = ""

	
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		print("bye")
		var file = FileAccess.open("user://graphics.log", FileAccess.WRITE)
		file.store_string(graphicslog)
		

func _process(delta):
	self.text = ("FPS:" + str(Engine.get_frames_per_second()))

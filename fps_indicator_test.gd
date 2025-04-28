extends Label

var graphicslog = ""

func _ready() -> void:
	OS.alert("This is a super early control/graphics test demo, your FPS will be tracked and saved.", "GPU")
	graphicslog += "Using GPU:" + RenderingServer.get_rendering_device().get_device_name()
	graphicslog += "\n\nOS: " + OS.get_name()
	
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		print("bye")
		var file = FileAccess.open("user://graphics.log", FileAccess.WRITE)
		file.store_string(graphicslog)
		OS.alert("Showing Graphics Log")
		OS.shell_show_in_file_manager(file.get_path_absolute())
var timer = 0.0
func _process(delta):
	timer+=delta
	self.text = ("FPS:" + str(Engine.get_frames_per_second()))
	if timer > 0.5:
		timer = 0.0
		graphicslog += "\n" + str(Engine.get_frames_per_second())

extends Camera3D

func _ready() -> void:
	Input.mouse_mode = Input.MouseMode.MOUSE_MODE_CAPTURED

func _process(delta: float) -> void:
	self.rotation_degrees.x = self.rotation_degrees.x * (1-delta)

func _input(event):
	if self.get_meta('canmove'):
		if event is InputEventMouseMotion:
			self.rotation_degrees.x=event.relative.y/50
			self.rotation_degrees.y=180 + event.relative.x/50

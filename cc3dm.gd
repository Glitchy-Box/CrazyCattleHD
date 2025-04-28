extends Node3D
func _ready() -> void:
	self.set_meta("debug", OS.is_debug_build())

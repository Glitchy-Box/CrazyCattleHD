extends GPUParticles3D

#simplest script ever :)
var time = 0.3
var timer = 0.0
func _process(delta: float) -> void:
	timer+=delta
	if timer > time:
		if self.emitting:
			self.emitting = false
			timer = 0.0
			time *=1.5
		else:
			queue_free()

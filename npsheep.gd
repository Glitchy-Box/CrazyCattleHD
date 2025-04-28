extends RigidBody3D
var explosion = preload("res://assets/explode.tscn").instantiate()
func _process(delta: float) -> void:
	if abs(self.rotation_degrees.z) > 70:
		explosion.global_position = self.global_position
		get_parent().add_child(explosion)
		self.queue_free()

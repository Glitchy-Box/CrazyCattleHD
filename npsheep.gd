extends RigidBody3D
var explosion = preload("res://assets/explode.tscn").instantiate()
func _process(delta: float) -> void:
	var target = get_node("../RigidBody3D")
	var target_dir = (target.global_transform.origin - global_transform.origin).normalized()
	var current_dir = global_transform.basis.z.normalized()
	
	var rotation_axis = current_dir.cross(target_dir).normalized()
	var angle_difference = acos(current_dir.dot(target_dir))
	
	var rotation_speed = 10.0
	
	angular_velocity = rotation_axis * angle_difference * rotation_speed
	
	self.apply_force(global_transform.basis * Vector3(0,0,75.0))
	if abs(self.rotation_degrees.z) > 70:
		explosion.global_position = self.global_position
		get_parent().add_child(explosion)
		self.queue_free()

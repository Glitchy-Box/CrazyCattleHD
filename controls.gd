extends RigidBody3D

var explosion = preload("res://assets/explode.tscn").instantiate()

func _ready() -> void:
	print("Warning: ts code kevin")

func _process(delta: float) -> void:
	if abs(self.rotation_degrees.z) > 70:
		self.queue_free()
		explosion.global_position = self.global_position
		get_parent().add_child(explosion)
		var nc = get_node("Camera3D").duplicate()
		self.get_parent().add_child(nc)
		nc.global_position = get_node("Camera3D").global_position
		nc.global_rotation = get_node("Camera3D").global_rotation
		nc.set_meta("canmove", false)
		get_node("Camera3D").queue_free()
		self.queue_free()
		
	if Input.is_action_pressed('ui_up'):
		self.apply_force(global_transform.basis * Vector3(0,0,100.0))
		#linear_velocity = global_transform.basis * Vector3(0,0,10.0)
	if Input.is_action_pressed('ui_down'):
		self.apply_force(global_transform.basis * Vector3(0,0,-100.0))
	if Input.is_action_pressed('ui_left'):
		self.angular_velocity.y = 0.1 * linear_velocity.length()
	if Input.is_action_pressed('ui_right'):
		self.angular_velocity.y = -0.1 * linear_velocity.length()
	 


func _on_player_area_entered(area: Area3D) -> void:
	print(area.name)
	if area.name == "bounce":
		print("jumping")
		self.apply_impulse(Vector3(0,50.0,0.0))

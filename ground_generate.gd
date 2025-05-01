extends MeshInstance3D

func _ready():
	var size = get_node("../..").get_meta("size")
	for x in range(get_node("../..").get_meta("amount")*(size/10)):
		var new_grass = get_node("root_grass").duplicate()
		new_grass.transform.origin.x += randf_range(0.0 - size *0.5, size *0.5)
		new_grass.transform.origin.y += randf_range(-0.1,0.05)
		new_grass.transform.origin.z += randf_range(0.0- size *0.5, size *0.5)
		new_grass.rotation_degrees.y = randi_range(0,360)
		new_grass.rotation_degrees.z = randi_range(-2,2)
		self.add_child(new_grass)

extends Node3D

func _ready() -> void:
	var size = self.get_meta('size')
	get_node("container").transform.origin = Vector3(-size/2, 0.0, -size/2)
	get_node("StaticBody3D/ground").mesh.size = Vector2(size,size)
	get_node("StaticBody3D/CollisionShape3D").shape.size = Vector3(size,0.15,size)
	

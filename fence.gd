extends MeshInstance3D

func is_odd(x: int):
	return x % 2 != 0

func _ready():
		#ts code is kevin
		var mapsize = get_node("../..").get_meta("size")
		#gurt
		var base = self.duplicate()
		for alt in range(2):
			
			
			
			for x in range(mapsize+1):
				
				var seg = base.duplicate()
				seg.set_script('')
				seg.transform.origin.z+=(x*5)
				seg.transform.origin.x= alt*(50*(mapsize/10))
				self.add_child(seg)
			
			for x in range(mapsize+1):
				
				var seg = base.duplicate()
				seg.set_script('')
				seg.transform.origin.x+=x*5
				seg.rotation_degrees.y = 90
				seg.transform.origin.z= alt*(50*(mapsize/10))
				self.add_child(seg)
		

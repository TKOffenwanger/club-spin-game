class_name Enemy extends CharacterBody3D

func get_hit_and_die(obj_velocity:Vector3):
	add_child(preload("res://scenes/hit_particles.tscn").instantiate())
	print("Getting hit and dying " + str(obj_velocity))

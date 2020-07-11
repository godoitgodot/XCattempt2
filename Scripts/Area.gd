extends Area



func _physics_process(delta):
	if overlaps_body(get_node("/root/Game/P1/")):
		get_node("/root/Game/P1/").stamina = get_node("/root/Game/P1/").stamina + .05
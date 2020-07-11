extends Area



func _on_Area_body_entered(body):
	if overlaps_body(get_node("/root/Game/P1/")):
		get_node("/root/Game/P1/").stamina = get_node("/root/Game/P1/").stamina + 100
		
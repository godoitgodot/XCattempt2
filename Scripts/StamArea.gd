extends Area


func _on_StamArea_body_entered(body):
	if overlaps_body(get_node("/root/Game/P1/")):
		get_node("/root/Game/P1/").cheating = true
	

func _on_StamArea_body_exited(body):
	if overlaps_body(get_node("/root/Game/P1/")):
		get_node("/root/Game/P1/").cheating = false
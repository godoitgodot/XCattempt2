extends Area



func _on_DNF_body_entered(body):
	if overlaps_body(get_node("/root/Game/P1/")):
		get_node("/root/Game/P1/").Timer_On = true
		$dnfLabel.visible = true
		
		
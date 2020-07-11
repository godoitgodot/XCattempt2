extends Area




func _ready():
	pass # Replace with function body.


func _on_SoccerballDNF_body_entered(body):
	if overlaps_body(get_node("/root/Game/P1/")):
		$dnfTimer.start() 
		

func _on_dnfTimer_timeout(): 
	if overlaps_body(get_node("/root/Game/P1/")) == true:
		get_node("/root/Game/P1/").Timer_On = true
		$TimerDNF.visible = true
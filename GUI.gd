extends MarginContainer

onready var bar = $TextureProgress

func _physics_process(delta):
	var player_max_stamina = get_node("/root/Game/P1/").max_stamina
	var stamina = get_node("/root/Game/P1/").stamina
	bar.max_value = player_max_stamina
	bar.value = stamina
	#print(stamina)



func _on_P1_stamina_changed(stamina):
	bar.value

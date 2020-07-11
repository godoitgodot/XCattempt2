extends AnimationPlayer



func _on_Teammate1_speed():
	if get_node("/root/Game/Paths/Path/PathFollow/Teammate1/").speed >= 4:
		playback_speed = 3
	if get_node("/root/Game/Paths/Path/PathFollow/Teammate1/").speed >= 6:
		playback_speed = 4
	if get_node("/root/Game/Paths/Path/PathFollow/Teammate1/").speed >= 7:
		playback_speed = 5
	if get_node("/root/Game/Paths/Path/PathFollow/Teammate1/").speed >= 8:
		playback_speed = 6
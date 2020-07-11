extends AnimationPlayer




func _on_Teammate3_speed():
	if get_node("/root/Game/Paths/Path3/PathFollow/Teammate3/").speed >= 4:
		playback_speed = 3
	if get_node("/root/Game/Paths/Path3/PathFollow/Teammate3/").speed >= 6:
		playback_speed = 4
	if get_node("/root/Game/Paths/Path3/PathFollow/Teammate3/").speed >= 7:
		playback_speed = 5
	if get_node("/root/Game/Paths/Path3/PathFollow/Teammate3/").speed >= 8:
		playback_speed = 6


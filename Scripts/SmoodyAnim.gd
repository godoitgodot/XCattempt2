extends AnimationPlayer



func _on_TeammateSmoody_speed():
	if get_node("/root/Game/Paths/Path7/PathFollow/TeammateSmoody/").speed >= 4:
		playback_speed = 3
	if get_node("/root/Game/Paths/Path7/PathFollow/TeammateSmoody/").speed >= 6:
		playback_speed = 4
	if get_node("/root/Game/Paths/Path7/PathFollow/TeammateSmoody/").speed >= 7:
		playback_speed = 5
	if get_node("/root/Game/Paths/Path7/PathFollow/TeammateSmoody/").speed >= 8:
		playback_speed = 6
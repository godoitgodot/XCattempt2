extends AnimationPlayer





func _on_FastMurr_speed():
	if get_node("/root/Game/Paths/Path2/PathFollow/FastMurr/").speed >= 4:
		playback_speed = 3
	if get_node("/root/Game/Paths/Path2/PathFollow/FastMurr/").speed >= 6:
		playback_speed = 4
	if get_node("/root/Game/Paths/Path2/PathFollow/FastMurr/").speed >= 7:
		playback_speed = 5
	if get_node("/root/Game/Paths/Path2/PathFollow/FastMurr/").speed >= 8:
		playback_speed = 6
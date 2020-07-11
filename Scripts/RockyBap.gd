extends AnimationPlayer





func _on_RockyB_speed():
	if get_node("/root/Game/Paths/Path6/PathFollow/RockyB/").speed >= 4:
		playback_speed = 3
	if get_node("/root/Game/Paths/Path6/PathFollow/RockyB/").speed >= 6:
		playback_speed = 4
	if get_node("/root/Game/Paths/Path6/PathFollow/RockyB/").speed >= 7:
		playback_speed = 5
	if get_node("/root/Game/Paths/Path6/PathFollow/RockyB/").speed >= 8:
		playback_speed = 6
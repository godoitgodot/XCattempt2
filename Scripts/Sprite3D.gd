extends Sprite3D

export var anim_col = 0


var camera = null
func set_camera(c):
		camera = c

func _process(delta):
	if camera == null:
		return
	
	var p_fwd = -camera.global_transform.basis.z
	var fwd = global_transform.basis.z
	var left = global_transform.basis.x
	
	var l_dot = left.dot(p_fwd)
	var f_dot = fwd.dot(p_fwd)
	var row = 0
	flip_h = false
	
	if f_dot < -0.85:
			row = 4
	elif f_dot > 0.85:
			row = 0
	else: 
		flip_h = l_dot > 0
		if abs(f_dot) < 0.5:
			row = 2
		elif f_dot < 0:
			row = 4
		else:
			row = 0
	
	frame = anim_col + row * 6
	
extends KinematicBody

export(float) var speed = 5.5
#export(PackedScene) var bullet
#From Maeonyx

signal update_position

var gravity = 20
var vertical_velocity = 0

var has_contact = false

func _physics_process(delta):
	var movement = Vector3(0, 0, 0)
	
	var camera_angle = get_node("/root/Game").get_camera_angle()
	
	if Input.is_action_pressed("ui_up"):
		movement += Vector3(0, 0, -1).rotated(Vector3(0, 1, 0), camera_angle)
		
	if Input.is_action_pressed("ui_down"):
		movement += Vector3(0, 0, 1).rotated(Vector3(0, 1, 0), camera_angle)
		
	#Diagnoal speed same as forward/back	
	movement = movement.normalized()
	movement *= speed
	
	vertical_velocity -= gravity * delta
	movement.y += vertical_velocity
	
	#From Jeremy Bullock Vid on slopes and gravity
	
	#if (is_on_floor()):
	#	has_contact = true
	#else:
	#	if !$Tail.is_colliding():
	#		has_contact = false
	
	#if (has_contact and !is_on_floor()):
	#	move_and_collide(Vector3(0, -1, 0))
	
	#It does mostly work for now but once the interface is changed it might need to be played with
	
	#move_and_slide(movement * speed)
	#or
	movement = move_and_slide(movement, Vector3(0, 1, 0))
	
	vertical_velocity = movement.y
	
	emit_signal("update_position", translation)

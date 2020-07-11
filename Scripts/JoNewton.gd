extends KinematicBody

var parent
var speed = 5
var rng = RandomNumberGenerator.new()
var counter = 0
var Timer_On = false
signal speed



func _ready():
	parent = get_parent()
	rng.randomize()
	
func _on_Timer_timeout():

	Timer_On = true


func _physics_process(delta):
	
	if Timer_On == false:
		get_node("/root/Game/Paths/Path5/PathFollow/JoNewton/CollisionShape/Limp/AnimationPlayer").playback_speed = 0
		return
		

	if parent.offset > 0 and counter == 0:
		counter += 1
		speed = rng.randi_range(6, 7)
	elif parent.offset > 20 and counter == 1: 
		counter += 1
		speed = rng.randi_range(6, 7)
	elif parent.offset > 30 and counter == 2: 
		counter += 1
		speed = rng.randi_range(6, 7)
	elif parent.offset > 80 and counter == 3: 
		counter += 1
		speed = rng.randi_range(7, 7)
	elif parent.offset > 120 and counter == 4: 
		counter += 1
		speed = rng.randi_range(6, 6)
	
	emit_signal("speed")
	parent.offset += delta * speed
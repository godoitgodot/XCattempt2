extends KinematicBody

var parent
var speed = 5
var rng = RandomNumberGenerator.new()
var counter = 0




func _ready():
	parent = get_parent()
	rng.randomize()
	


func _physics_process(delta):
	
	if parent.offset > 0 and counter == 0:
		counter += 1
		speed = rng.randi_range(8, 8)
	elif parent.offset > 20 and counter == 1: 
		counter += 1
		speed = rng.randi_range(8, 8)
	elif parent.offset > 30 and counter == 2: 
		counter += 1
		speed = rng.randi_range(8, 8)
	elif parent.offset > 80 and counter == 3: 
		counter += 1
		speed = rng.randi_range(8, 8)
	elif parent.offset > 120 and counter == 4: 
		counter += 1
		speed = rng.randi_range(8, 8)
	
	
	parent.offset += delta * speed
	
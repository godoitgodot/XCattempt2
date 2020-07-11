extends KinematicBody

var speed = 1.5
var jogging_speed = 0.1

signal stamina_changed

var max_stamina : = 100.0
var stamina = max_stamina
var stamina_empty = 0.0

const gravity = 9.8 # metres / second / second
const friction = 0.98 # each frame the velocity decreases by 2%
const vertical_axis = Vector3(0, 1, 0)
const ten_degrees = 10 * TAU/360
const twenty_degrees = ten_degrees + ten_degrees
const thirty_degrees = ten_degrees + ten_degrees + ten_degrees
const fourty_degrees = ten_degrees + ten_degrees + ten_degrees + ten_degrees
const fifty_degrees = ten_degrees + ten_degrees + ten_degrees + ten_degrees + ten_degrees
const sixty_degrees = ten_degrees + ten_degrees + ten_degrees + ten_degrees + ten_degrees + ten_degrees

var velocity = Vector3(1, 0, 0).rotated(vertical_axis, rotation.y)

var cheating = false 

var keypress_allowed = true

var Timer_On = true

func _on_Timer_timeout():
		Timer_On = false

func allow_keypresses_again():
    keypress_allowed = true
    
# _input happens when a key is pressed or the mouse is moved etc.
# it is more efficient to use _input for input (when possible) than _physics_process
    

func _input(event):

    if not keypress_allowed:
        return
    
    var movement = Vector3()
    
    # forward direction is the players current direction
    var forward = velocity
    
    
    # Running should only move us horizontally even if we are currently
    # moving upwards or downwards.
    forward.y = 0
    
    forward = forward.normalized()
	
    if Timer_On == true:
        speed = 0
        get_node("/root/Game/P1/CollisionShape/Sprite3D/AnimationPlayer").playback_speed = 0
    else:			
        speed = 1.5
        get_node("/root/Game/P1/CollisionShape/Sprite3D/AnimationPlayer").playback_speed = 3
    if cheating == true:
        speed = .75
        stamina -= .5
        get_node("/root/Game/P1/CollisionShape/Sprite3D/AnimationPlayer").playback_speed = 1.5
		#Can mess with this more later, need to associate animation playback speed with velocity.length
    # each key is rotated further from the forward direction
    # to move directly forward, the player can alternate left_1 and right_1


    if event.is_action_pressed("move_left_1"):
        movement += forward.rotated(vertical_axis, ten_degrees)
    if event.is_action_pressed("move_left_2"):
        movement += forward.rotated(vertical_axis, twenty_degrees)
    if event.is_action_pressed("move_left_3"):
        movement += forward.rotated(vertical_axis, fourty_degrees)
    if event.is_action_pressed("move_left_4"):
        movement += forward.rotated(vertical_axis, sixty_degrees)
    
    if event.is_action_pressed("move_right_1"):
        movement += forward.rotated(vertical_axis, -ten_degrees)
    if event.is_action_pressed("move_right_2"):
        movement += forward.rotated(vertical_axis, -twenty_degrees)
    if event.is_action_pressed("move_right_3"):
        movement += forward.rotated(vertical_axis, -fourty_degrees)
    if event.is_action_pressed("move_right_4"):
        movement += forward.rotated(vertical_axis, -sixty_degrees)
    
    # if we did actually move, prevent keypresses for a short amount of time.
    if movement.length() != 0:
        keypress_allowed = false
        $KeypressTimer.start()
    



    
    movement *= speed
    
    velocity += movement


#Now animation is linked to velocity.length...but could definitley use some refinement

    if velocity.length() >= 13:
        stamina -= .7
        get_node("/root/Game/P1/CollisionShape/Sprite3D/AnimationPlayer").playback_speed = 11
    if velocity.length() >= 12 and velocity.length() < 13:
        stamina -= .6
        get_node("/root/Game/P1/CollisionShape/Sprite3D/AnimationPlayer").playback_speed = 10
    if velocity.length() >= 11 and velocity.length() < 12:
        stamina -= .5
        get_node("/root/Game/P1/CollisionShape/Sprite3D/AnimationPlayer").playback_speed = 9
    if velocity.length() >= 10 and velocity.length() < 11:
        stamina -= .4
        get_node("/root/Game/P1/CollisionShape/Sprite3D/AnimationPlayer").playback_speed = 8
    if velocity.length() >= 9 and velocity.length() < 10:
        stamina -= .3
        get_node("/root/Game/P1/CollisionShape/Sprite3D/AnimationPlayer").playback_speed = 7
    if velocity.length() >= 8 and velocity.length() < 9:
        stamina -= .2
        get_node("/root/Game/P1/CollisionShape/Sprite3D/AnimationPlayer").playback_speed = 6
    if velocity.length() >= 7 and velocity.length() < 8:
        stamina -= .1
        get_node("/root/Game/P1/CollisionShape/Sprite3D/AnimationPlayer").playback_speed = 5
    if velocity.length() >= 6 and velocity.length() < 7:
        get_node("/root/Game/P1/CollisionShape/Sprite3D/AnimationPlayer").playback_speed = 4
    if velocity.length() >= 5 and velocity.length() < 6:
        get_node("/root/Game/P1/CollisionShape/Sprite3D/AnimationPlayer").playback_speed = 3
    stamina = clamp (stamina, 0.0, 100.0)
    #print(stamina)
	
    if stamina == stamina_empty:
        $KeypressTimer.wait_time = .11
    if stamina > 0:
        $KeypressTimer.wait_time = .02
		
	
	
    emit_signal("stamina_changed", "stamina")
	
    #if velocity.length() < .5:
       # velocity.length() + 1
	
func _physics_process(delta):
    
	
    # Friction with minimum speed (jogging speed)
    # Friction applies to vertical velocity too. Depending on the strength of
    # gravity we will reach a terminal velocity, not sure what it will be.
    var jogging_velocity = velocity.normalized() * jogging_speed
    var velocity_after_friction = velocity * friction
    if jogging_velocity.length() > velocity_after_friction.length():
        velocity = jogging_velocity
    else:
        velocity = velocity_after_friction
   

    velocity.y -= gravity * delta
    #print(velocity.length())
    velocity = move_and_slide(velocity, vertical_axis)

	

    
    # z direction is reversed because positive y-direction is downwards in 2D
    rotation.y = Vector2(velocity.x, -velocity.z).angle()


		

		
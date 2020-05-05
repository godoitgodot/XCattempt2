extends KinematicBody

export(float) var speed = 5.5
export(float) var jogging_speed = 2.0

const gravity = 9.8 # metres / second / second
const friction = 0.98 # each frame the velocity decreases by 2%
const vertical_axis = Vector3(0, 1, 0)
const ten_degrees = 10 * TAU/360
const twenty_degrees = ten_degrees + ten_degrees
const thirty_degrees = ten_degrees + ten_degrees + ten_degrees
const fourty_degrees = ten_degrees + ten_degrees + ten_degrees + ten_degrees

var velocity = Vector3(1, 0, 0).rotated(vertical_axis, rotation.y)

# _input happens when a key is pressed or the mouse is moved etc.
# it is more efficient to use _input for input (when possible) than _physics_process
func _input(event):
    var movement = Vector3()
    
    # forward direction is the players current direction
    var forward = velocity
    
    # Running should only move us horizontally even if we are currently
    # moving upwards or downwards.
    forward.y = 0
    
    forward = forward.normalized()
    
    # each key is rotated further from the forward direction
    # to move directly forward, the player can alternate left_1 and right_1
    if event.is_action_pressed("move_left_1"):
        movement += forward.rotated(vertical_axis, ten_degrees)
    if event.is_action_pressed("move_left_2"):
        movement += forward.rotated(vertical_axis, twenty_degrees)
    if event.is_action_pressed("move_left_3"):
        movement += forward.rotated(vertical_axis, thirty_degrees)
    if event.is_action_pressed("move_left_4"):
        movement += forward.rotated(vertical_axis, fourty_degrees)
    
    if event.is_action_pressed("move_right_1"):
        movement += forward.rotated(vertical_axis, -ten_degrees)
    if event.is_action_pressed("move_right_2"):
        movement += forward.rotated(vertical_axis, -twenty_degrees)
    if event.is_action_pressed("move_right_3"):
        movement += forward.rotated(vertical_axis, -thirty_degrees)
    if event.is_action_pressed("move_right_4"):
        movement += forward.rotated(vertical_axis, -fourty_degrees)
    
    movement *= speed
    
    velocity += movement

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
    
    velocity = move_and_slide(velocity, vertical_axis)
    
    # z direction is reversed because positive y-direction is downwards in 2D
    rotation.y = Vector2(velocity.x, -velocity.z).angle()

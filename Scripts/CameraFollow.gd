extends Spatial

# The path to the player eg. "../Player1"
# You need to set this by clicking "Assign..." in the editor
export(NodePath) var player_path
onready var player = get_node(player_path)

func _physics_process(delta):
    # Make the camera follow the player
    translation = translation.linear_interpolate(player.translation, 0.3)
    
    # Make the camera rotate the same way as the player.
    # In order to smoothly interpolate between rotations in 3D we need to use quaternions, this took
    # me a little while to figure out how to do in Godot. You can change the interpolation speed
    # with the final number.
    transform.basis = transform.basis.get_rotation_quat().slerp(player.transform.basis.get_rotation_quat(), 0.1)

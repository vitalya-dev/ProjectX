extends State
class_name PlayerState

var player: Player

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	yield(owner, "ready")
	player = owner
	
func get_input_direction() -> Vector3:
	var f_input = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	var h_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	if f_input != 0 or h_input != 0:
		return Vector3(h_input, 0, f_input).normalized()
	return Vector3.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

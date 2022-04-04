extends PlayerState

var fall = Vector3.ZERO
var snap: Vector3 = Vector3.ZERO
var move: Vector3 = Vector3.ZERO 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		player.rotate_y(deg2rad(-event.relative.x * player.mouse_sense))
		player.head.rotate_x(deg2rad(-event.relative.y * player.mouse_sense))
		player.head.rotation.x = clamp(player.head.rotation.x, deg2rad(-89), deg2rad(89))

func unhandled_input(event):
	return

func process(delta: float) -> void:
	return


func physics_process(delta: float) -> void:
	var f_input = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	var h_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	move = (player.transform.basis.x * h_input + player.transform.basis.z * f_input)


func enter(msg: Dictionary = {}) -> void:
	return


func exit() -> void:
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

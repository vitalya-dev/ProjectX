extends PlayerState
class_name MoveState

var fall = Vector3.ZERO
var snap: Vector3 = Vector3.ZERO
var move: Vector3 = Vector3.ZERO 
var speed_modifier: float = 1.0
var speed: float = 10
var mouse_sense: float = 0.2
var gravity: float = 20
var jump_height: float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		player.rotate_y(deg2rad(-event.relative.x * mouse_sense))
		player.head.rotate_x(deg2rad(-event.relative.y * mouse_sense))
		player.head.rotation.x = clamp(player.head.rotation.x, deg2rad(-89), deg2rad(89))

func unhandled_input(event):
	if event.is_action_pressed("jump") and _state_machine.state.name != "Air":
		_state_machine.transition_to("Move/Air", { fall = Vector3.UP * (sqrt(2 * gravity * jump_height * lerp(1, 3, player.get_floor_angle()))) })


func process(delta: float) -> void:
	return

func physics_process(delta: float) -> void:
	if move.length_squared() > 0:
		move = move.normalized()
	player.move_and_slide_with_snap(move * speed * speed_modifier + fall, snap, Vector3.UP)
	


func enter(msg: Dictionary = {}) -> void:
	return


func exit() -> void:
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

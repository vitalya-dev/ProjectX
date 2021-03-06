extends PlayerState
class_name MoveState

var crouching = false
var fall = Vector3.ZERO
var snap: Vector3 = Vector3.ZERO
var move: Vector3 = Vector3.ZERO
var normal_speed: float = 20
var crouch_speed: float = 10 
var speed: float = normal_speed

var mouse_sense: float = 0.2
var gravity: float = 20
var jump_height: float = 0.7

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and _state_machine.state.name != "Air":
		_state_machine.transition_to("Move/Air", { fall = Vector3.UP * sqrt(2 * gravity * jump_height) })
	if event.is_action_pressed("crouch"):
		player.a_player.play("Crouch")
		crouching = true
	if event.is_action_released("crouch"):
		player.a_player.stop(false)
		player.a_player.play("Crouch", -1, -1)
		crouching = false
	if event is InputEventMouseMotion:
		player.rotate_y(deg2rad(-event.relative.x * mouse_sense))
		player.head.rotate_x(deg2rad(-event.relative.y * mouse_sense))
		player.head.rotation.x = clamp(player.head.rotation.x, -PI / 2, PI)

func unhandled_input(event: InputEvent) -> void:
	if _parent:
		_parent.unhandled_input(event)

func process(delta: float) -> void:
	return

func physics_process(delta: float) -> void:
	if move.length_squared() > 0:
		move = move.normalized()
		player.move_and_slide_with_snap(move * speed, snap, Vector3.UP)
	if fall.length_squared() > 0:
		player.move_and_slide_with_snap(fall, snap, Vector3.UP)


	
func enter(msg: Dictionary = {}) -> void:
	return


func exit() -> void:
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends KinematicBody
class_name Player



onready var head = $Head
onready var camera = $Head/Camera
onready var a_player: AnimationPlayer = $AnimationPlayer
onready var step_ray_lower: RayCast = $StepRayLower
onready var step_ray_upper: RayCast = $StepRayUpper
onready var debug : Label = $Debug as Label

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)



func _process(delta):
	debug.text = $StateMachine.state.name + "\n"
	debug.text += str($StateMachine/Move.move)

#func _physics_process(delta):
#	if is_on_floor():
#		snap = -get_floor_normal()
#		var f_input = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
#		var h_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
#		move = (transform.basis.x * h_input + transform.basis.z * f_input)
#		if move.length() > 0:
#			move = move.normalized()
#		fall = Vector3.ZERO
#		if Input.is_action_just_pressed("jump"):
#			fall = Vector3.UP * (sqrt(2 * gravity * jump_height))
#			snap = Vector3.ZERO
#		speed_modifier = 1
#	else:
#		fall += Vector3.DOWN * gravity * delta
#		snap = Vector3.DOWN
#		speed_modifier = 0.5
#
#	move_and_slide_with_snap(move * speed * speed_modifier + fall, snap, Vector3.UP)

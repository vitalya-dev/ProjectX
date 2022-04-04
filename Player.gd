extends KinematicBody
class_name Player

var speed = 10
var speed_modifier = 1
var mouse_sense = 0.2
var gravity = 20
var jump_height = 1

onready var head = $Head
onready var camera = $Head/Camera

func _ready():
	#hides the cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	pass
	#get mouse input for camera rotation


#func _process(delta):
#	if Engine.get_frames_per_second() > Engine.iterations_per_second:
#		print("Jitter")
#
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

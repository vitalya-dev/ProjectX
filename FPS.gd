extends KinematicBody

var speed = 10
var mouse_sense = 0.1
var gravity = 9.8
var gravity_vector = Vector3.ZERO
var move: Vector3 = Vector3.ZERO 
var jump_impulse = 5


onready var head = $Head
onready var camera = $Head/Camera

func _ready():
	#hides the cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	#get mouse input for camera rotation
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_sense))
		head.rotate_x(deg2rad(-event.relative.y * mouse_sense))
		head.rotation.x = clamp(head.rotation.x, deg2rad(-89), deg2rad(89))

func _process(delta):
	#camera physics interpolation to reduce physics jitter on high refresh-rate monitors
	pass
		
func _physics_process(delta):
	print(is_on_floor())	
	if is_on_floor():
		var f_input = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
		var h_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		move = (transform.basis.x * h_input + transform.basis.z * f_input)
		if move.length() > 0:
			move = move.normalized()
		gravity_vector = Vector3.ZERO
	else:
		gravity_vector += Vector3.DOWN * gravity * delta
		move = Vector3.ZERO
	move_and_slide_with_snap(move * speed + gravity_vector, Vector3.DOWN, Vector3.UP)
	

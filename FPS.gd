extends KinematicBody

var speed = 10
var mouse_sense = 0.1
var gravity = 9.8
var jump_impulse = 5 
var gravity_vector = Vector3.ZERO

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
	var move_direction = Vector3.ZERO
	if is_on_floor():
		print("On Floor")
		if Input.is_action_just_pressed("jump"):
			gravity_vector = Vector3.UP * jump_impulse
		else:
			gravity_vector = Vector3.ZERO
		var f_input = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
		var h_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		var move_horizontal = transform.basis.x * h_input
		var move_forward = transform.basis.z * f_input
		move_direction = (move_horizontal + move_forward).normalized()
	else:
		print("Not On Floor")
		gravity_vector += Vector3.DOWN * gravity * delta
	move_and_slide(move_direction * speed + gravity_vector, transform.basis.y)	

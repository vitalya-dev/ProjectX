extends KinematicBody
class_name Player

signal killed()

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
	debug.text += str($StateMachine/Move.fall)
	
func _physics_process(delta):
	for i in range(get_slide_count()):
		if get_slide_collision(i).collider.is_in_group("guillotines"):
			emit_signal("killed")

extends KinematicBody
class_name Player

signal killed(node)

onready var head = $Head
onready var camera = $Head/Camera
onready var a_player: AnimationPlayer = $AnimationPlayer
onready var debug : Label = $Debug as Label
onready var area = $Area

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	area.connect("body_entered", self, "_on_body_enetered")

func _process(delta):
	debug.text = $StateMachine.state.name + "\n"
	debug.text += str($StateMachine/Move.move)
	debug.text += str($StateMachine/Move.fall)
	
func _physics_process(delta):
	pass

func _on_body_enetered(body: Node):
	if body.is_in_group("guillotines"):
		emit_signal("killed", body)

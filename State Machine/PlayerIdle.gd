extends PlayerState


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func input(event: InputEvent) -> void:
	_parent.input(event)

func unhandled_input(event: InputEvent) -> void:
	_parent.unhandled_input(event)
		
		

func process(delta: float) -> void:
	_parent.process(delta)


func physics_process(delta: float) -> void:
	_parent.physics_process(delta)
	if player.is_on_floor() and get_input_direction().length_squared() > 0:
		_state_machine.transition_to("Move/Run")
	elif not player.is_on_floor():
		_state_machine.transition_to("Move/Air")


func enter(msg: Dictionary = {}) -> void:
	_parent.enter(msg)
	_parent.snap = -player.get_floor_normal()
	_parent.move = Vector3.ZERO


func exit() -> void:
	_parent.exit()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

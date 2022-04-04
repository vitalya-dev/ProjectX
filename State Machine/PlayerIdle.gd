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
	return

func process(delta: float) -> void:
	return


func physics_process(delta: float) -> void:
	_parent.physics_process(delta)
	print(player.is_on_floor())
	if player.is_on_floor() and _parent.move.length() > 0:
		_state_machine.transition_to("Move/Run")


func enter(msg: Dictionary = {}) -> void:
	return


func exit() -> void:
	return
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

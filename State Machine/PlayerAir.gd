extends PlayerState


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func input(event: InputEvent) -> void:
	_parent.input(event)

func unhandled_input(event: InputEvent) -> void:
	_parent.unhandled_input(event)

func process(delta: float) -> void:
	_parent.process(delta)


func physics_process(delta: float) -> void:
	_parent.physics_process(delta)
	_parent.fall += Vector3.DOWN * _parent.gravity * delta
	if player.is_on_floor():
		_state_machine.transition_to("Move/Idle")


func enter(msg: Dictionary = {}) -> void:
	match msg:
		{"fall": var fall}:
			_parent.fall = fall
		_:
			_parent.fall = Vector3.ZERO
	_parent.snap = Vector3.ZERO
	_parent.speed *= 0.25

func exit() -> void:
	_parent.fall = Vector3.ZERO
	_parent.speed *= 4


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

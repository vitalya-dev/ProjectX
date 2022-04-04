extends State
class_name PlayerState

var player: Player

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	yield(owner, "ready")
	player = owner


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

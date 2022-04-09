extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	_create_stairs()


func _create_stairs():
	var previous_part: Stairs = $Stairs
	for i in range(500):
		var current_part: Stairs = preload("res://Level/Stairs.tscn").instance()
		current_part.transform.origin = previous_part.get_connection_point()
		add_child(current_part)
		previous_part = current_part

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print($Stairs.get_connection_point())
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
		

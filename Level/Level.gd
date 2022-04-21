extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	_create_tower()



#func _create_tower():
#	print("create_tower")
#	var tower_previous: TowerPart = $"Tower/Tower Start"
#	for i in range(50):
#		var tower_current: TowerPart = preload("res://Level/Tower Middle.tscn").instance() as TowerPart
#		$Tower.add_child(tower_current)
#		tower_current.global_transform.origin = (tower_previous.get_connection_point())
#		tower_previous = tower_current
#		yield(get_tree(), "idle_frame")


#func _create_stairs():
#	var previous_part: Stairs = $Stairs
#	for i in range(500):
#		var current_part: Stairs = preload("res://Level/Stairs.tscn").instance()
#		current_part.transform.origin = previous_part.get_connection_point()
#		add_child(current_part)
#		previous_part = current_part

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
		

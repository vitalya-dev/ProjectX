extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player: Player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	_create_player()
	
func _create_player():
	player = preload("res://Player/Player.tscn").instance()
	player.connect("killed", self, "_on_player_killed")
	add_child(player)
	player.transform.origin = $StartPoint.transform.origin

func _on_player_killed():
	if not player.is_queued_for_deletion():
		###################################################
		var ragdoll = preload("res://RagDoll.tscn").instance()
		ragdoll.transform = player.transform
		add_child(ragdoll)
		###################################################
		player.queue_free()
		yield(player, "tree_exited")
		yield(get_tree(), "idle_frame")
		###################################################
		_create_player()

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
		

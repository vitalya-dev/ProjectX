extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var tower_a = $TowerA
	var tower_b = $TowerB
	for i in range(10):
		tower_b.transform.origin = tower_a.transform.origin + Vector3(0, 8.9, 0)
		tower_a = tower_b
		tower_b = tower_b.duplicate()
		add_child(tower_b)
		yield(get_tree(), "idle_frame")
	##########################################################
	$GuillotineA.translate(tower_b.transform.origin)
	##########################################################
	tower_b.queue_free()
	##########################################################
	_start_guillotine_spawner()


func _start_guillotine_spawner():
	var guillotine_a: Guillotine = $GuillotineA
	while true:
		var rnd: float = rand_range(1, 5)
		yield(get_tree().create_timer(rnd), "timeout")
		var guillotine_b: Guillotine =  guillotine_a.duplicate()
		guillotine_b.linear_velocity = 8.9 / rnd
		guillotine_b.rotation_velocity = 2 * PI / rnd
		add_child(guillotine_b)
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

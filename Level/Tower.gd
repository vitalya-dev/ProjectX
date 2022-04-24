extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed_multiplier = 0.5
# Called when the node enters the scene tree for the first time.
func _ready():
	var tower_a = $TowerA
	var tower_b = $TowerB
	for i in range(1):
		tower_b.transform.origin = tower_a.transform.origin + Vector3(0, 8.9, 0)
		tower_a = tower_b
		tower_b = tower_b.duplicate()
		add_child(tower_b)
		yield(get_tree(), "idle_frame")
	##########################################################
	$GuillotineA.translate(tower_b.transform.origin)
	$GuillotineB.translate(tower_b.transform.origin)
	##########################################################
	tower_b.queue_free()
	##########################################################
	#_start_guillotine_fall()


func _start_guillotine_fall():
	while true:
		yield(get_tree().create_timer(rand_range(1, 5)), "timeout")
		var pattern = _generate_pattern()
		yield(_instanctiate_pattern(pattern), "completed")

func _generate_pattern():
	var pattern: Array = []
	for i in range(1 + randi() % 5):
		pattern.append(randi() % 2)
	return pattern

func _instanctiate_pattern(pattern):
		var guillotine_a: Guillotine = $GuillotineA
		var guillotine_b: Guillotine = $GuillotineB
		var guillotine_c: Guillotine  = null
		for i in pattern:
			match i:
				0:
					guillotine_c = guillotine_a.duplicate()
				1:
					guillotine_c = guillotine_b.duplicate()
			guillotine_c.linear_velocity = 8.9 * speed_multiplier
			guillotine_c.rotation_velocity = 2 * PI * speed_multiplier
			add_child(guillotine_c)
			yield(get_tree().create_timer(1), "timeout")
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

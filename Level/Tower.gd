extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var tower_a = $TowerA
	var tower_b = $TowerB
	for i in range(500):
		tower_b.transform.origin = tower_a.transform.origin + Vector3(0, 8.9, 0)
		tower_a = tower_b
		tower_b = tower_b.duplicate()
		add_child(tower_b)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

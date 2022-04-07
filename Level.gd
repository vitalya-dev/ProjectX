extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var initial_block = preload("res://Block.tscn").instance()
	initial_block.transform = $Player.transform
	initial_block.translate(Vector3(0, -1.75, -1))
	add_child(initial_block)
	for i in range(500):
		var block = preload("res://Block.tscn").instance()
		block.transform = initial_block.transform
		block.translate(Vector3(0, 0.1, -2))
		add_child(block)
		initial_block = block
		yield(get_tree(), "idle_frame")
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

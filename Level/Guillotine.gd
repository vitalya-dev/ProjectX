extends StaticBody
class_name Guillotine

# Declare member variables here. Examples:
# var a = 2`
# var b = "text"

var linear_velocity = 0
var rotation_velocity = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(rotation_velocity * delta * -1)
	translate(Vector3.DOWN * linear_velocity * delta)

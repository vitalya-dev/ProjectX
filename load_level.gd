tool
extends EditorScript

enum MAP_OBJECT {
	NONE,
	WALL,
	DOOR,
	HDOOR,
	VDOOR,
	STAIR
}

var wall = Color8(255, 0, 0)
var door = Color8(128, 0, 0)
var stair = Color8(192, 192, 192)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _run():
	load_level()
	
func load_level():
	var map_parsed = _parse_map(preload("res://Map.png").get_data())
	for o in map_parsed:
		match o.type:
			MAP_OBJECT.WALL:
				var wall = preload("res://Wall.tscn").instance()
				get_scene().add_child(wall)
				wall.set_owner(get_scene())
				wall.translation = Vector3(o.x * 2, 0, o.y * 2)
	
	
func _parse_map(map):
	var map_parsed = []
	###########################################
	map.lock()
	for y in map.get_height():
		for x in map.get_width():
			match map.get_pixel(x, y):
				wall:
					map_parsed.append({type = MAP_OBJECT.WALL, x = x, y = y})
				door:
					if _is_horizontal_4_same(map, y, x):
						map_parsed.append({type = MAP_OBJECT.HDOOR, x = x, y = y})
					elif _is_vertical_4_same(map, y, x):
						map_parsed.append({type = MAP_OBJECT.VDOOR, x = x, y = y})
				stair:
					if _is_7x6_rect_same(map, y, x):
						map_parsed.append({type = MAP_OBJECT.STAIR, x = x, y = y})
				_:
					pass
	map.unlock()
	###########################################
	return map_parsed

func _is_horizontal_4_same(map, y, x):
	for i in range(4):
		if map.get_pixel(x, y) != map.get_pixel(x+i, y):
			return false
	return true
	
func _is_vertical_4_same(map, y, x):
	for j in range(4):
		if map.get_pixel(x, y) != map.get_pixel(x, y+j):
			return false
	return true

func _is_7x6_rect_same(map, y, x):
	for i in range(6):
		for j in range(7):
			if map.get_pixel(x, y) != map.get_pixel(x+j, y+i):
				return false
	return true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

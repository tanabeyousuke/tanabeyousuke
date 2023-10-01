extends Sprite2D

var base = position
var base_kakudo = rotation

func _process(delta):
	if Input.is_action_pressed("shot") or Input.is_action_pressed("slow"):
		var root = get_node("/root")
		var tama = Global.bullet.instantiate()
		tama.position = global_position
		tama.things = 2
		tama.angle = rad_to_deg($"../".rotation) + rad_to_deg(rotation)
		root.add_child(tama)
	
	if Input.is_action_pressed("slow"):
		position.x = 0
		position.y = -100
		rotation = 0
	else:
		position = base
		rotation = base_kakudo

extends Area2D

var count = 0
var start = 0
var hp = 200
const type = "enemy"

var tama = preload('res://seen/tama.tscn')

func hit(damage):
	hp = hp - damage

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

func _process(delta):
	if hp <= 0 or global_position.y > 814:
		$"../".breaked()
		queue_free()

	if count % 30 != 0:
		position.x = position.x + start
		position.y = position.y + (count % 45) - 15
	else:
		cshot(position.x, position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - position.y), deg_to_rad(Global.zpx - position.x))) - deg_to_rad(90), 3)
		cshot(position.x, position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - position.y), deg_to_rad(Global.zpx - position.x))) - deg_to_rad(90), 7)

	count = count + 1

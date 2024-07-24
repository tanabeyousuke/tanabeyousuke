extends Area2D

var count = 0
var hp = 10000
const type = "tizyou"
const soten = 10000

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
	if count % 90 == 0:
		for i in range(5):
			cshot(global_position.x, global_position.y + 17, rad_to_deg(atan2(deg_to_rad(Global.zpy - position.y) , deg_to_rad(Global.zpx - position.x)))     , (i * 2) + 1)
	
	count = count + 1	

	if hp < 0:
		queue_free()

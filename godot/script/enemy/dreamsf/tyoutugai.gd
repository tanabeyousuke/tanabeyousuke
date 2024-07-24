extends Area2D

var count = 0
var hp = 5000
const type = "tizyou"

var left = 1
var right = 1

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
	if count % 30 == 0:
		if left == 0:
			for i in range(10):
				cshot(global_position.x, global_position.y, i * 10 - 45, 10)
		
		if right == 0:
			for i in range(10):
				cshot(global_position.x, global_position.y, i * 10 - 45 + 180, 10)

	rotation = atan2(Global.zpy - global_position.y, Global.zpx - global_position.x) - deg_to_rad(90)

	if hp < 0:
		queue_free()

	count = count + 1

extends Area2D

var count = 0
var start = 0
var hp = 100
const type = "enemy"

var tama = preload("res://seen/tama.tscn")

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
	rotation = atan2(Global.zpy - position.y, Global.zpx - position.x)
	position.x = position.x + cos(rotation) * 5
	position.y = position.y + cos(rotation) * 5

	if count % 5 == 0:
		cshot(position.x, position.y, rad_to_deg(rotation), 10)
		cshot(position.x, position.y, rad_to_deg(rotation) + 90, 7)
		cshot(position.x, position.y, rad_to_deg(rotation) - 90, 7)

	if hp <= 0 or global_position.y > 800 or global_position.y < 0 or global_position.x < 0 or global_position.x > 600 :
		for i in range(10):
			for ro in range(3):
				cshot(position.x, position.y, (i * 36) + ro, (ro * 0.5) + 7)
		queue_free()

	count = count + 1

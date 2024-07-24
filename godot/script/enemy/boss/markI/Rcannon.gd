extends Area2D

var count = 0
var hp = 7500
const type = "tizyou"
var tama = preload('res://seen/tama.tscn')
const soten = 7500

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
	if count % 60 == 0:
		for i in range(10):
			cshot(global_position.x + 6, global_position.y + 77, (180 / 10) * i, 7)
	count = count + 1

	if hp < 0:
		queue_free()
	

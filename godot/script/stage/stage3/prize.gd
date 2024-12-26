extends Area2D

var hp = 3000
var count = 0
const type = "enemy"


var tama = preload('res://seen/tama.tscn')

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

func hit(damage):
	hp = hp - damage

func _process(delta):
	match $"../".state:
		2:
			position.y = position.y - 5
			cshot(global_position.x, global_position.y, count * 12.3456, 7)
			cshot(global_position.x, global_position.y, count * 12.3456 + 180, 7)

		3:
			if position.y != 1000:
				cshot(global_position.x, global_position.y, count * 12.3456, 7)
				cshot(global_position.x, global_position.y, count * 12.3456 + 180, 7)
				position.y = position.y + 10
				
	if hp < 0:
		queue_free()

	count = count + 1

extends Sprite2D

var count = 0
var state = 0

var tama = preload('res://seen/tama.tscn')

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

func _process(delta):
	match state:
		0:
			$"ufo".position.y = $"ufo".position.y + 5
			if $"ufo".position.y == 600:
				state = 1
		1:
			$"ufo/right".rotation = $"ufo/right".rotation + deg_to_rad(1)
			$"ufo/left".rotation = $"ufo/left".rotation - deg_to_rad(1)

			if $"ufo/right".rotation > deg_to_rad(75):
				state = 2
		2:
			$"ufo".position.y = $"ufo".position.y - 5
			$"prize".position.y = $"prize".position.y - 5
			cshot($"prize".global_position.x, $"prize".global_position.y, count * 12.3456, 7)
			cshot($"prize".global_position.x, $"prize".global_position.y, count * 12.3456 + 180, 7)

			if $"ufo".position.y == 300:
				state = 3
		3:
			$"ufo/right".rotation = $"ufo/right".rotation - deg_to_rad(1)
			$"ufo/left".rotation = $"ufo/left".rotation + deg_to_rad(1)

			if $"prize".position.y != 1000:
				cshot($"prize".global_position.x, $"prize".global_position.y, count * 12.3456, 7)
				cshot($"prize".global_position.x, $"prize".global_position.y, count * 12.3456 + 180, 7)
				$"prize".position.y = $"prize".position.y + 10
				
			if $"ufo/right".rotation < deg_to_rad(0):
				state = 0

	count = count + 1

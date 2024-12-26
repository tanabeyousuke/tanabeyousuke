extends Sprite2D

var count = 0
var state = 0

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

			if $"ufo".position.y == 300:
				state = 3
		3:
			$"ufo/right".rotation = $"ufo/right".rotation - deg_to_rad(1)
			$"ufo/left".rotation = $"ufo/left".rotation + deg_to_rad(1)

				
			if $"ufo/right".rotation < deg_to_rad(0):
				state = 0

	count = count + 1

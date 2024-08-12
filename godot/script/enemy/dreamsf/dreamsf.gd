extends Area2D

var count = 0
var hp = 5000
const type = "tizyou"
var state = 0
var opt = 0

func hit(damage):
	hp = hp - damage

func _process(delta):
	match state:
		0:
			position.y = position.y + 7
			if position.y > 400:
				opt = position.y
				state = 1
				count = 0
		1:
			position.y = (-300 * sin(deg_to_rad(count + 180))) + opt
			if count == 270:
				state = 2
				count = 0
		2:
			position.y = position.y + 1
				
	if hp < 0 or position.y > 900:
		$"../".opt = 1
		queue_free()

	count = count + 1

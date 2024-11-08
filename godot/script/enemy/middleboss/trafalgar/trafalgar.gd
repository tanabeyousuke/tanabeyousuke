extends Area2D

var engine = 1
var hp = 10000
var attack = 1

const type = "tizyou"

func hit(damage):
	hp = hp - damage

func _process(delta):
	# if engine == 1:
	# 	position.y = position.y - 1.3
	# else:
	# 	if global_position.y > 250:
	# 		engine = 1
			
	if hp <= 0:
		queue_free()

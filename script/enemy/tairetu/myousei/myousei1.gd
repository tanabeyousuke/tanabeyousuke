extends Area2D

const type = "tairetu"
var myousei = preload("res://seen/enemy/myousei.tscn")
var state = 0
var count = 0

func _process(delta):
	match state:
		0:
			if count % 45 == 0:
				var ro = myousei.instantiate()
				ro.position.x = count + 100
				ro.position.y = -35
				ro.scriptnum = 0
				ro.rl = 0
				add_child(ro)

			if count == 225:
				state = 1
				count = 0

		1:
			if count == 60:
				state = 2
				count = 0
				
		2:
			if count % 45 == 0:
				var ro = myousei.instantiate()
				ro.position.x = 600 - count - 100
				ro.position.y = -35
				ro.scriptnum = 0
				ro.rl = 1
				add_child(ro)
			if count == 225:
				state = 3

		3:
			pass

	count = count + 1

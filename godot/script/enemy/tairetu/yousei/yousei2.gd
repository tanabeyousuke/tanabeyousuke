extends Area2D

const type = "tairetu"
var yousei = preload("res://seen/enemy/yousei.tscn")
var state = 0
var count = 0


func _process(delta):
	match state:
		0:
			if count % 20 == 0:
				for i in range(2):
					var ro = yousei.instantiate()
					ro.position.x = 450 + (i * 20) - (count / 5)
					ro.position.y = -25
					ro.scriptnum = 1
					ro.rl = 1
					add_child(ro)
			if count == 120:
				count = 0
				state = 1

		1:
			if count % 20 == 0:
				for i in range(2):
					var ro = yousei.instantiate()
					ro.position.x = 150 + (i * 20) + (count / 5)
					ro.position.y = -25
					ro.scriptnum = 1
					ro.rl = 0
					add_child(ro)
			if count == 120:
				count = 0
				state = 2
		
	count = count + 1	

extends Area2D

const type = "tairetu"
var kedama = preload("res://seen/enemy/kedama.tscn")
var count = 0
var state = 0

func _process(delta):
	if count % 300 == 0 and count < 1200:
		for ro in range(4):
			var i = kedama.instantiate()
			i.position.y = -25
			i.scriptnum = 2
			if count % 600 == 0:
				i.position.x = 100 + (ro * 50)
				i.rl = 0
			else:
				i.position.x = 500 - (ro * 50)
				i.rl = 1
			add_child(i)

	count = count + 1

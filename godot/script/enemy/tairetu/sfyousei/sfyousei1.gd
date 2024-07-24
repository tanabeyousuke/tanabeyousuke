extends Area2D

const type = "tairetu"
var sfyousei = preload("res://seen/enemy/sfyousei.tscn")
var kedama = preload("res://seen/enemy/kedama.tscn")
var count = 0

func _process(delta):
	if count < 600:
		if count % 21 == 0:
			var i = kedama.instantiate()
			i.position.y = 200 + (randi() % 50)
			i.scriptnum = 3
			if count % 2 == 0:
				i.position.x = -25
				i.rl = 0
			else:
				i.position.x = 625
				i.rl = 1
			add_child(i)
			
		if count == 10:
			var ro = sfyousei.instantiate()
			ro.position.x = 300
			ro.position.y = -60
			ro.scriptnum = 0
			add_child(ro)
			
	count = count + 1

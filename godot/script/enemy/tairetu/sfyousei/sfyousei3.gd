extends Area2D


const type = "tairetu"
var sfyousei = preload("res://seen/enemy/sfyousei.tscn")
var count = 0

func _process(delta):
	if count < 2000:
		if count == 0:
			var i = sfyousei.instantiate()
			i.position.x = 550
			i.scriptnum = 2
			add_child(i)
		if count == 1000:
			var i = sfyousei.instantiate()
			i.position.x = 50
			i.scriptnum = 2
			add_child(i)
			
	count = count + 1

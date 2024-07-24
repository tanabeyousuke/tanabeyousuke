extends Area2D

const type = "tairetu"
var sfyousei = preload("res://seen/enemy/sfyousei.tscn")
var count = 0

func _process(delta):
	if count < 1000:
		if count % 500 == 0:
			var i = sfyousei.instantiate()
			i.position.x = 100
			i.scriptnum = 1
			add_child(i)
			i = sfyousei.instantiate()
			i.position.x = 500
			i.scriptnum = 1
			add_child(i)


	count = count + 1

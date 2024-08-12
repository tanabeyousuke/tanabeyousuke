extends Area2D

const type = "tairetu"

var sfyousei = preload("res://seen/enemy/sfyousei.tscn")
var count = 0

func _process(delta):
	if count == 0:
		var i = sfyousei.instantiate()
		i.position.x = 200
		i.position.y = 50
		i.scriptnum = 3
		add_child(i)
		
		i = sfyousei.instantiate()
		i.position.x = 400
		i.position.y = 0
		i.scriptnum  = 3
		add_child(i)

	count = count + 1

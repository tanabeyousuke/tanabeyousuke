extends Area2D

const type = "tairetu"
var yousei = preload("res://seen/enemy/yousei.tscn")
var count = 0

func _process(delta):
	if count % 30 == 0:
		var i = yousei.instantiate()
		i.scriptnum = 2
		i.position.y = -25
		if (count / 30) % 20 < 10:
			i.position.x = ((count / 30) % 10) * 60
		else:
			i.position.x = 600 - (((count / 30) % 10) * 60)
		add_child(i)
	count = count + 1

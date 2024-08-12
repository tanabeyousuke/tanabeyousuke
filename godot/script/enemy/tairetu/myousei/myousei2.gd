extends Area2D

const type = "tairetu"
var yousei = preload("res://seen/enemy/yousei.tscn")
var myousei = preload("res://seen/enemy/myousei.tscn")
var state = 0
var count = 0

func _process(delta):
	if count < 600:
		if count % 120 == 0 :
			var i = myousei.instantiate()
			i.position.x = randi() % 598 + 1
			i.position.y = -35
			i.scriptnum = 1
			add_child(i)

		if count % 100 == 0:
			var i = yousei.instantiate()
			i.position.x = randi() % 598 + 1
			i.position.y = -25
			i.scriptnum = 4
			i.opt = randi() % 2
			add_child(i)
	
	count = count + 1
	

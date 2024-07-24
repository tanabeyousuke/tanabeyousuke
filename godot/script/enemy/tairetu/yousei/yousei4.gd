extends Area2D

const type = "tairetu"
var yousei = preload("res://seen/enemy/yousei.tscn")
var count = 0


func _process(delta):
	if count < 900:
		if count % 30 == 0:
			#print("call")
			var i = yousei.instantiate()
			i.scriptnum = 3
			i.position.y = -50
			i.position.x = 300
			i.opt = (randi() % 14) - 7
			add_child(i)

	count = count + 1

	

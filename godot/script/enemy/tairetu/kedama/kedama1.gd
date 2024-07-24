extends Area2D

const type = "tairetu"
var kedama = preload("res://seen/enemy/kedama.tscn")
var count = 0

func _process(delta):
	if count < 2250:
		if count % 45 == 0:
			var i = kedama.instantiate()
			i.position.y = 825 + (randi() % 50)
			i.scriptnum = 0
			if count % 2 == 0:
				i.position.x = (randi() % 100) + 30
			else:
				i.position.x = (randi() % 100) + 470
			add_child(i)

				
	
	count = count + 1

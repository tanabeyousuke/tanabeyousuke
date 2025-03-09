extends Node2D

var movestate = 0
var pstart = 0

var uzura = preload("res://seen/enemy/middleboss/uzura.tscn")

func _process(delta):
	match movestate:
		0:#uzura
			if pstart == 0:
				var root = get_tree().root
				var uzr = uzura.instantiate()
				uzr.position.x = 300
				uzr.position.y = 400
				root.add_child(uzr)
				pstart = 0

			if pstart == 220:
				pstart = -1
				movestate = 1
				
		1:
			
			position.y = position.y + 7
			if position.y > 1200:
				pstart = -1
				movestate = 2

		2: #trafalgar
			position.y = position.y + 1.5
			if position.y > 3520:
				pstart = -1
				movestate = 3

		3:
			position.x = position.x + 1.3
			if position.x > 500:
				pstart = -1
				movestate = 4

	pstart = pstart + 1

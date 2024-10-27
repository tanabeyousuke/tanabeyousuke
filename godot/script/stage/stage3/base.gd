extends Node2D

var count = 0
var movestate = 0
var pstart = 0

var uzura = preload("res://seen/enemy/middleboss/uzura.tscn")

func _process(delta):
	print(position.y)
	match movestate:
		0:#uzura
			if count == 0:
				var root = get_tree().root
				var uzr = uzura.instantiate()
				uzr.position.x = 300
				uzr.position.y = 400
				root.add_child(uzr)
				pstart = 0

			if pstart == 180:
				pstart = -1
				movestate = 1
				
		1:
			
			position.y = position.y + 10
			if position.y > 330:
				pstart = -1
				movestate = 2

		2: #trafalgar
			position.y = position.y + 2
			if position.y > 3520:
				pstart = -1
				movestate = 3

	pstart = pstart + 1
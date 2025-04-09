extends Node2D

var movestate = 0
var pstart = 0
var root

var uzura = preload("res://seen/enemy/middleboss/uzura.tscn")
var tubo = preload("res://seen/enemy/middleboss/itamae/tubo.tscn")

func _process(delta):
	match movestate:
		0:#uzura
			if pstart == 0:
				root = get_tree().root
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
			position.y = position.y + 7
			if position.y > 3520:
				pstart = -1
				movestate = 3

		3:
			position.x = position.x + 2.5
			if pstart == 0:
				var itamae = tubo.instantiate()
				itamae.global_position.y = -300
				itamae.basey = -300
				root.add_child(itamae)

			if position.x > 4000:
				print(pstart)
				pstart = -1
				movestate = 4

	pstart = pstart + 1

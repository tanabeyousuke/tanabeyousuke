extends Area2D

const type = "tairetu"
var reccabound = preload("res://seen/enemy/reccabound.tscn")
var nokori = 20
var count = 0

func breaked():
	nokori = nokori - 1
	if nokori == 0:
		Global.stage.next()
		queue_free()

var enemnum = 0
func _process(delta):
	if count % 10 == 0 and enemnum < 21:
		var i = reccabound.instantiate()
		i.position.x = 100
		i.position.y = -30
		i.start = 1
		add_child(i)
		enemnum = enemnum + 1

	count = count + 1

extends Area2D

var p = 0
var hp = 50000
var count = 0
var tama = preload('res://seen/tama.tscn')
const type = "tairetu"
const soten = 3000

var yousei = preload('res://seen/enemy/yousei.tscn')

func _process(delta):
	var space = 50
	if count % space == 0:
		for i in range(12):
			var y = yousei.instantiate()
			y.position.x = 0
			y.position.y = 0
			y.scriptnum = 6
			y.opt = i * 30 + 90
			if count % (space * 2) == 0:
				y.rl = 0
			else:
				y.rl = 1
			add_child(y)
			
	count = count + 1
	

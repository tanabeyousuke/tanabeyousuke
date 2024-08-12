extends Area2D

const type = "tairetu"
var dreamsf = preload("res://seen/enemy/dreamsf.tscn")
var tankm = preload("res://seen/enemy/tankm.tscn")
var yousei = preload("res://seen/enemy/yousei.tscn")
var count = 0
var opt = 0

func _process(delta):
	if count < 720:
		if count % 60 == 0:
			var i = tankm.instantiate()
			i.position.y = 100
			if (count < 180) or (count < 540 and count >= 360):
				i.position.x = 0
				i.rl = 0
			else:
				i.position.x = 600
				i.rl = 1
			add_child(i)

	if count > 300:
		if opt == 0:
			if count % 60 == 0:
				var i = yousei.instantiate()
				i.position.x = 75
				i.position.y = -25
				i.scriptnum = 4
				if count % 120 == 0:
					i.opt = 0
				else:
					i.opt = 1
				add_child(i)
			
				i = yousei.instantiate()
				i.position.x = 525
				i.position.y = -25
				i.scriptnum = 4
				if count % 120 == 0:
					i.opt = 1
				else:
					i.opt = 0
				add_child(i)
					
	if count == 720:
		var i = dreamsf.instantiate()
		i.position.x = 300
		i.position.y = -75
		add_child(i) 
		
	count = count + 1 

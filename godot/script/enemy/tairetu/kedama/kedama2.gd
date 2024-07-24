extends Area2D

const type = "tairetu"
var kedama = preload("res://seen/enemy/kedama.tscn")
var count = 0

func _process(delta):
	if count < 1125:
		if count % 45 == 0:
			print(count)
			var i = kedama.instantiate()
			var ro = randi() % 4
			match ro:
				0:
					i.position.y = -25
					i.position.x = randi() % 600
				
				1:
					i.position.y = 825
					i.position.x = randi() % 600
				
				2:
					i.position.x = -25
					i.position.y = randi() % 800

				3:
					i.position.x = 625
					i.position.y = randi() % 800
			
			i.opt = atan2(deg_to_rad(Global.zpy - i.position.y), deg_to_rad(Global.zpx - i.position.x))
			i.scriptnum = 1
			add_child(i)

	count = count + 1		

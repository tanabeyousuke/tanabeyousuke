extends Area2D

const type = "tairetu"
var kasou = preload("res://seen/enemy/kasou.tscn")
var nokori = 12
var state = 0
var count = 0

func breaked():
	nokori = nokori - 1
	if nokori == 0:		
		Global.stage.next()
		queue_free()

func _ready():
	global_position.y = -200
	for i in range(2):
		for ro in range(6):
			var ha = kasou.instantiate()
			ha.position.x = (randi() % 50) + 25 + (ro * 100)
			ha.position.y = (randi() % 50) + 25 + (i * 100)
			add_child(ha)
	
func _process(delta):
	match state:
		0:
			if global_position.y < 0:
				global_position.y = global_position.y + 5
			else:
				state = 1

		1:
			count = count + 1
			if count == 180:
				state = 2
				

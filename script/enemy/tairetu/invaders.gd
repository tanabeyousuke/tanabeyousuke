extends Area2D

const type = "tairetu"
var invader = preload("res://seen/enemy/invader.tscn")
var nokori = 30
var state = 0
var count = 0

func breaked():
	nokori = nokori - 1
	if nokori == 0:
		Global.stage.next()
		queue_free()

func _ready():
	for i in range(6):
		for ro in range(5):
			var ha = invader.instantiate()
			if i % 2 == 0:
				ha.position.x = (ro * 120) + 600 + 120
				ha.rl = 1
			else:
				ha.position.x = (ro * 120) - 600 
				ha.rl = 0
			ha.position.y = i * 80 + 60
			
			if i < 2:
				ha.color = 2
			elif i < 4:
				ha.color = 1
			elif i < 6:
				ha.color = 0
			add_child(ha)
				

func _process(delta):
	count = count + 1
	match state:
		0:
			if count == 67:
				state = 1
		1:
			if count == 420:
				state = 2


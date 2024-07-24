extends Area2D

const type = "tairetu"
var stingray = preload("res://seen/enemy/stingray.tscn")
var nokori = 7
var state = 0
var count = 0

func breaked():
	nokori = nokori - 1
	if nokori == 0:
		Global.stage.next()
		queue_free()
		
func _ready():
	for i in range(nokori):
		var ro = stingray.instantiate()
		ro.position.x = (i + 0.5) * (600 / 7)
		ro.count = abs(i - 3) * 50
		add_child(ro)

		

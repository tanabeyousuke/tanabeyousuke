extends Area2D

const type = "tairetu"
var toroid = preload("res://seen/enemy/toroid.tscn")
var nokori = 10

func breaked():
	nokori = nokori - 1
	if nokori == 0:
		Global.stage.next()
		queue_free()

func _ready():
	for i in range(nokori):
		var ro = toroid.instantiate()
		ro.position.x = (randi() % 200) + 600
		ro.position.y = (randi() % 400) - 100
		ro.start = 1
		add_child(ro)

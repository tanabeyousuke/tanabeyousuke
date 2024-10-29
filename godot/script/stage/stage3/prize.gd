extends Area2D

var hp = 3000
const type = "enemy"

func hit(damage):
	hp = hp - damage


func _process(delta):
	if hp < 0:
		queue_free()

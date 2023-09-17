extends Area2D


var angle = 0
var things = 0

func _ready():
	rotation = deg_to_rad(angle)
	$"Tama".frame = things

func _process(delta):
	position.x = position.x - 40 * cos(deg_to_rad(angle + 90))
	position.y = position.y - 40 * sin(deg_to_rad(angle + 90))
	if position.y < -20:
		queue_free()

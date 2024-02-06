extends Area2D

var angle = 0
var speed = 10
const type = "tama"
func _process(delta):
	position.x = position.x + speed * cos(deg_to_rad(angle))
	position.y = position.y + speed * sin(deg_to_rad(angle))
	
	if(position.x < -25 or position.x > 625 or position.y < -25 or position.y > 825):
		queue_free()

extends Area2D

var angle
var speed

func _process(delta):
	position.x = position.x + speed * cos(angle)
	position.y = position.y + speed * sin(angle)
	
	if(position.x < -25 or position.x > 625 or position.y < -25 or position.y > 825):
		queue_free()

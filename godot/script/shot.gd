extends Area2D


var angle = 0
var things = 0
var damage = 0

func _ready():
	rotation = deg_to_rad(angle)
	$"Tama".frame = things
	match things:
		0:
			damage = 15
		1:
			damage = 10
		2:
			damage = 5

func _process(delta):
	position.x = position.x - 40 * cos(deg_to_rad(angle + 90))
	position.y = position.y - 40 * sin(deg_to_rad(angle + 90))
	if position.y < -20:
		queue_free()

func _on_area_entered(area:Area2D):
	print("hit!")
	if area.TYPE == "enemy" or area.TYPE == "tizyou":
		area.hit(damage)

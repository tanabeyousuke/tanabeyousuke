extends Area2D

var tama = preload('res://seen/tama.tscn')
const type = "enemy"

func cshot(x, y, angle, speed):
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	$"../".add_child(bullet)

func _process(delta):
	pass

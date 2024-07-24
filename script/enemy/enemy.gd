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

func cziki(x, y, angle, speed):
	cshot(x, y, rad_to_deg(atan2(deg_to_rad(Global.zpy - position.y) , deg_to_rad(Global.zpx - position.x)) + angle), speed)



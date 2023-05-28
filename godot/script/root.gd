extends Node2D


var ziki = preload("res://seen/ziki.tscn").instantiate()

func bullet(x,y,angle,speed):
	var tama = preload("res://seen/tama1.tscn").instantiate()
	tama.position.x = x
	tama.position.y = y
	tama.angle = deg_to_rad(angle)
	tama.speed = speed
	add_child(tama)

func zbullet(x, y, angle, speed):
	pass

func _ready():
	ziki.position.x = 240
	ziki.position.y = 450
	add_child(ziki)

var i = 0
var ha = 0

func _update(delta):
	bullet(200, 200, 90, 10)

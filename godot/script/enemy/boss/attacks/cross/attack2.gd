extends Area2D

var p = 0
var hp = 50000
var count = 0
var tama = preload('res://seen/tama.tscn')
const type = "tairetu"
const soten = 3000

func hit(damage):
	hp = hp - damage

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

func _init():
	p.atkobj = $"./"

func _process(delta):
	count 

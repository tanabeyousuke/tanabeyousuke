extends Area2D

var p = 0
var hp = 50000
var count = 0
var tama = preload('res://seen/tama.tscn')
const type = "tairetu"
const soten = 2500

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

var atoz 
func _process(delta):
	p.position.x = sin(deg_to_rad(count * 4)) * 100 + 300
	p.position.y = sin(deg_to_rad(count)) * 70 + 150

	var base = randi() % 25 + randf()
	cshot(0, 0, 90 - base, 7)
	cshot(600, 0, 90 + base, 7)

	if count % 60 == 0:
		atoz = rad_to_deg(atan2(Global.zpy - p.position.y, Global.zpx - p.position.x))
		for i in range(7):
			var angle = (i - 3) * 4 + atoz
			cshot(p.position.x, p.position.y, angle, 10)
	elif count % 60 == 20:
		for i in range(6):
			var angle = (i - 3) * 4 + atoz + 2
			cshot(p.position.x, p.position.y, angle, 20)
	elif count % 60 == 40:
		var sposx = (randi() % 200) - 100 + p.position.x
		var sposy = (randi() % 200) - 100 + p.position.y
		atoz = rad_to_deg(atan2(Global.zpy - sposy, Global.zpx - sposx))
		cshot(sposx, sposy, atoz, 15)
	count = count + 1

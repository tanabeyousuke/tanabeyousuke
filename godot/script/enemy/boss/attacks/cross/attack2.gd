extends Area2D

var p = 0
var hp = 60000
var count = 0
var tama = preload('res://seen/tama.tscn')
const type = "tairetu"
const soten = 2500
var opt1 = 0

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

func _process(delta):
	if count % 300 <= 150:
		p.position.x = p.position.x + (Global.zpx - p.position.x) / 30
		if count % 300 == 0:
			opt1 = Global.zpy
		if count % 20 == 0:
			for i in range(32):
				var shoty = i * 25 + opt1 % 25
				if count % 600 < 300:
					shoty = shoty + 13
					
				cshot(1, shoty, 0, 3)
				cshot(599, shoty - 10, 180, 3)

	else:
		if count % 15 == 0:
			var atoz = rad_to_deg(atan2(Global.zpy - p.position.y, Global.zpx - p.position.x))
			for i in range(11):
				var angle = (i - 5) * 5 + atoz   
				cshot(p.position.x, p.position.y, angle, 10)

	if count == 7200 or hp <= 0:
		p.delay = 150
		queue_free()
		
	count = count + 1

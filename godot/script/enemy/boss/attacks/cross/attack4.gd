extends Area2D

var p = 0
var hp = 50000
var count = 0
var tama = preload('res://seen/tama.tscn')
const type = "tairetu"
const soten = 2500
var state = 60.0
var base = 0.0

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

func way(a):
	cshot(p.position.x - 100, p.position.y + 50, a, 3)
	cshot(p.position.x - 200, p.position.y + 100, a, 3)
	cshot(p.position.x + 100, p.position.y + 50, a, 3)
	cshot(p.position.x + 200, p.position.y + 100, a, 3)
	
func _process(delta):
	if count % 5 == 0:
		cshot(p.position.x, p.position.y, 30, 3)
		cshot(p.position.x, p.position.y, 150, 3)

		for i in range(8):
			var angle = base - state * (i - 3.5)
			cshot(p.position.x - 100, p.position.y + 50, angle + 75, 3)
			cshot(p.position.x - 200, p.position.y + 100, angle + 45, 3)
			angle = base + state * (i - 3.5)
			cshot(p.position.x + 100, p.position.y + 50, angle + 105, 3)
			cshot(p.position.x + 200, p.position.y + 100, angle + 135, 3)

		

	if count % 1000 == 999:
		var atoi = rad_to_deg(atan2(Global.zpy - p.position.y, Global.zpx - p.position.x))
		for i in range(5):
			cshot(p.position.x, p.position.y, i * 5 + atoi, 8)
			cshot(p.position.x, p.position.y, i * -5 + atoi, 8)
			cshot(p.position.x, p.position.y, i * 5 + atoi, 10)
			cshot(p.position.x, p.position.y, i * -5 + atoi, 10)

		for i in range(6):
			cshot(p.position.x, p.position.y, i * 5 + 2.5 + atoi, 6)
			cshot(p.position.x, p.position.y, i * -5 - 2.5 + atoi, 6)
			cshot(p.position.x, p.position.y, i * 5 + 2.5 + atoi, 12)
			cshot(p.position.x, p.position.y, i * -5 - 2.5 + atoi, 12)
			
	if count < 200:
		pass
	
	elif count <= 450:
		state = state - 0.125

	elif count <= 460:
		pass

	elif count <= 640:
		base = base - 0.125
		
	elif count <= 1000:
		base = base + 0.125

	elif (count - 1000) % 720 < 360:
		base = base - 0.125

	else:
		base = base + 0.125
	count = count + 1
	

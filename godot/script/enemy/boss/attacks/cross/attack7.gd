extends Area2D
#black heart

var p = 0
var hp = 50000
var count = 0
var tama = preload('res://seen/tama.tscn')
const type = "tairetu"
const soten = 2500

var yousei = preload('res://seen/enemy/yousei.tscn')

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

var sangle = 0
var down = 0
func _process(delta):
	var atoz = rad_to_deg(atan2(Global.zpy - p.position.y, Global.zpx - p.position.x))
	if count % 2000 <= 500:
		p.position.x = sin(deg_to_rad(count * 2.5)) * 200.0 + 300 
		if count % 20 == 0:
			var i = yousei.instantiate()
			i.scriptnum = 3
			i.position.y = p.position.y
			i.position.x = p.position.x
			i.opt = 0
			get_tree().root.add_child(i)

			cshot(p.position.x, p.position.y, atoz, 7)
			cshot(p.position.x, p.position.y, atoz + 20, 7)
			cshot(p.position.x, p.position.y, atoz - 20, 7)

		elif count % 20 == 5:
			cshot(p.position.x, p.position.y, atoz + 10, 7)
			cshot(p.position.x, p.position.y, atoz - 10, 7)
			

	elif count % 2000 <= 1000:
		p.position.x = cos(deg_to_rad(count)) * 150 + 300
		p.position.y = sin(deg_to_rad(count)) * 150 + 200

		if count % 60 == 0:
			for i in range(20):
				cshot(p.position.x, p.position.y, atoz + i * 18,  15)
		elif count % 60 == 15:
			cshot(p.position.x, p.position.y, atoz, 18)
			cshot(p.position.x, p.position.y, atoz + 15, 18)
			cshot(p.position.x, p.position.y, atoz - 15, 18)
		elif count % 60 == 30:
			cshot(p.position.x, p.position.y, atoz + 7, 20)
			cshot(p.position.x, p.position.y, atoz - 7, 20)
			

	elif count % 2000 <= 1500:
		for i in range(5):
			cshot(p.position.x + 50, p.position.y, atoz + sangle + (i * 30 - 60), 20)
			cshot(p.position.x - 50, p.position.y, atoz + sangle + (i * 30 - 60), 20)

		var a = count % 2000
		if a <= 1040:
			pass
		elif a <= 1080:
			sangle = sangle + 1.5
		elif a <= 1160:
			sangle = sangle - 1.5
		elif a <= 1240:
			sangle = sangle + 1.5
		elif a <= 1320:
			sangle = sangle - 1.5
		elif a <= 1400:
			sangle = sangle + 1.5
		print(sangle)
			
	else:
		if count % 2000 <= 1600:
			p.position.x = p.position.x + (Global.zpx - p.position.x) / 30
			p.position.y = p.position.y + ((Global.zpy - 100) - p.position.x) / 30
		elif p.position.y <= 700 and down == 0:
			p.position.y = p.position.y + 5
			if p.position.y > 700:
				down = 1

		elif p.position.y > 200:
			p.position.y = p.position.y - 4
			cshot(p.position.x + 50, p.position.y, 90, 10)
			cshot(p.position.x - 50, p.position.y, 90, 10)

			cshot(p.position.x + 50, p.position.y, 81 - (count % 10 * 9), 10)
			cshot(p.position.x - 50, p.position.y, 99 + (count % 10 * 9), 10)

	count = count + 1

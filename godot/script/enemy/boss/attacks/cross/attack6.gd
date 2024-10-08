extends Area2D
#mad ball

var p = 0
var hp = 50000
var time = 0
var tama = preload('res://seen/tama.tscn')
const type = "tairetu"
const soten = 2500

var yousei = preload('res://seen/enemy/yousei.tscn')
var myousei = preload('res://seen/enemy/myousei.tscn')
var attackcode = [
	#count, +radius, atk, now
	30, 0, 0, 1,
	100, 1, 0, 2,
	200, 0, 1, 3,
	100, -1, 1, 4,
	200, 0, 0, 5,
	50, 1, 0, 6,
	50, 1, 2, 7,
	200, 0, 2, 8,
	100, -1, 2, 9,
	200, 0, 0, 1
]

var now = 0
var radius = 100
var count = 0
var atk = 0
var atkangle = 0

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

var mangle = 0
func _process(delta):
	if time == 0:
		for i in range(8):
			var m = myousei.instantiate()
			m.scriptnum = 2
			m.position.x = 0
			m.position.y = 0
			m.opt = i
			add_child(m)
			
	if time % 150 < 90:
		if time % 150 == 0:
			if 600 - p.position.x > 300:
				mangle = 0
				if 400 - p.position.y < 200:
					mangle = mangle - randi() % 90
				else:
					mangle = mangle + randi() % 90
			else:
				mangle = 180
				if 400 - p.position.y < 200:
					mangle = mangle + randi() % 90
				else:
					mangle = mangle - randi() % 90

		p.position.x = p.position.x + cos(deg_to_rad(mangle))
		p.position.y = p.position.y + sin(deg_to_rad(mangle))

			

	if count == 0:
		now = attackcode[(now * 4) + 3]
		count = attackcode[(now * 4) + 0]
		atk = attackcode[(now * 4) + 2]

		
	if atk == 2 and count == 200:
		atkangle = rad_to_deg(atan2(Global.zpy - global_position.y, Global.zpx - global_position.x))
		
	radius = radius + attackcode[(now * 4) + 1]
	count = count - 1

	time = time + 1

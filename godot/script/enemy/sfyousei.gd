extends Area2D

var count = 0
var hp = 3000
const type = "enemy"

var rl = 0
var appearance = 0
var scriptnum = 3
var opt = 0
var state = 0

var tama = preload('res://seen/tama.tscn')
var yousei = preload('res://seen/enemy/yousei.tscn')

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

func sfyousei0():
	if count < 100:
		position.y = position.y + (250 - position.y) / 50
	else:
		for i in range(4):
			cshot(position.x + 60, position.y, rad_to_deg(atan2(Global.zpy - position.y, Global.zpx - position.x)) + 30 - (i * 15), 20)
			cshot(position.x - 60, position.y, rad_to_deg(atan2(Global.zpy - position.y, Global.zpx - position.x)) - 30 +  (i * 15), 20)

func sfyousei1():
	if count < 100:
		position.y = position.y + (250 - position.y) / 50
	else:
		if count % 5 == 0:			
			for i in range(3): 
				for ro in range(5):
					cshot(position.x, position.y, (120 * i - 90) + ro + count, ro * 0.3 + 4 )
				cshot(position.x, position.y, 90 - count, i + 10)
				
func sfyousei2():
	if count < 100:
		position.y = position.y + (250 - position.y) / 50
	else:
		position.y = position.y + 0.2

	if (Global.zpx - position.x) > 0:
		position.x = position.x + 1
	elif (Global.zpx - position.x) < 0:
		position.x = position.x - 1
		
	if count % 240 < 120:
		if count % 20 == 0:
			for i in range(15):
				cshot(position.x, position.y, rad_to_deg(atan2(Global.zpy - position.y, Global.zpx - position.x)) + (i * 5) - 35, 5)
	else:
		for i in range(7):
			cshot(position.x + 60, position.y, rad_to_deg(atan2(Global.zpy - position.y, Global.zpx - (position.x + 60))) + (i * 15) - 45, 10)
			cshot(position.x - 60, position.y, rad_to_deg(atan2(Global.zpy - position.y, Global.zpx - (position.x - 60))) + (i * 15) - 45, 10)

func sfyousei3():
	if count == 0:
		for i in range(5):
			var ro = yousei.instantiate()
			ro.count = i * 72
			ro.scriptnum = 5
			add_child(ro)

	if count % 30 == 0:
		for ha in range(5):
			cshot(global_position.x, global_position.y, rad_to_deg(atan2(Global.zpy - global_position.y, Global.zpx - global_position.x)), ha * 2 + 2)
	position.y = position.y + 0.5
	
			
func _process(delta):
	match scriptnum:
		0:
			sfyousei0()
		1:
			sfyousei1()
		2:
			sfyousei2()
		3:
			sfyousei3()

	if appearance == 1:
		if hp < 0 or position.x < -60 or position.y < -60 or position.x > 660 or position.y > 860:
			queue_free()
			print("dead")
	else:
		if count == 100:
			appearance = 1

	count = count + 1

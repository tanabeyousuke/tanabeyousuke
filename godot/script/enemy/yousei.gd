extends Area2D

var count = 0
var hp = 400
const type = "enemy"

var rl = 0
var appearance = 0
var scriptnum = 4
var opt = 0
var state = 0

var tama = preload('res://seen/tama.tscn')

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

func yousei0():
	if count < 100:
		if rl == 0:
			position.x = position.x + 2
		else:
			position.x = position.x - 2
		position.y = position.y + 3
	else:
		if rl == 0:
			position.x = position.x + 0.5
		else:
			position.x = position.x - 0.5
		position.y = position.y + 0.5
	
	if count > 50 and opt == 1:
		cshot(position.x, position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - position.y), deg_to_rad(Global.zpx - position.x))), 20)

func yousei1():
	if count < 150:
		if rl == 0:
			position.x = position.x - 0.3
		else:
			position.x = position.x + 0.3
		position.y = position.y + 1.5
	else:
		if rl == 0:
			position.x = position.x + 2
		else:
			position.x = position.x - 2
		position.y = position.y + 0.3	
		if randi() % 60 == 0:
			cshot(position.x, position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - position.y), deg_to_rad(Global.zpx - position.x))) + (randi() % 30) - 15, 2)
		

func yousei2():
	position.y = position.y + 3

	if count % 60 == 1:
		for i in range(5):
			cshot (position.x, position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - position.y), deg_to_rad(Global.zpx - position.x))), (i * 3) + 3)

func yousei3():
	if state == 0:
		position.x = position.x + opt
		position.y = position.y + (count / 2)

		if position.y > 700:
			state = 1
	else:
		position.y = position.y - 2

	if position.x < 0 or position.x > 600:
		opt = opt * -1

	if count % 30 == 0:
		for i in range(5):
			cshot(position.x, position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - position.y), deg_to_rad(Global.zpx - position.x))) + (2 * (i - 2)), 3)

func yousei4():
	if position.y < 500:
		position.y = position.y + 3
	else:
		if opt == 0:
			if rotation < deg_to_rad(90):
				rotation = rotation + deg_to_rad(1)
		else:
			if rotation > deg_to_rad(-90):
				rotation = rotation - deg_to_rad(1)
		position.x = position.x + cos(rotation + deg_to_rad(90)) * 3
		position.y = position.y + sin(rotation + deg_to_rad(90)) * 3

	if count % 10 == 0:
		cshot(position.x, position.y, rad_to_deg(atan2(Global.zpy - position.y, Global.zpx - position.x)), 10 )

func yousei5():
	position.x = cos(deg_to_rad(count * 21)) * 120
	position.y = sin(deg_to_rad(count * 21)) * 120
	
	if count % 6 == 0:
		cshot(global_position.x, global_position.y, rad_to_deg(atan2(Global.zpy - global_position.y, Global.zpx - global_position.x)) + randi() % 8 - 4, 5)

func yousei6():
	global_position.x = global_position.x + cos(deg_to_rad(opt)) * 2
	global_position.y = global_position.y + sin(deg_to_rad(opt)) * 2

	if count % 10 == 0:
		var i = 0
		if rl == 0:
			i = opt + 90
		else:
			i = opt - 90
		cshot(global_position.x, global_position.y, i, 3)

func _process(delta):
	match scriptnum:
		0:
			yousei0()
		1:
			yousei1()
		2:
			yousei2()
		3:
			yousei3()
		4:
			yousei4()
		5:
			yousei5()
		6:
			yousei6()
			
	if appearance == 1:
		if hp < 0 or global_position.x < -25 or global_position.y < -25 or global_position.x > 625 or global_position.y > 825:
			match scriptnum:
				2:
					for i in range(10):
						cshot(position.x, position.y, rad_to_deg(atan2(deg_to_rad(-600 - position.y), deg_to_rad(300 - position.x))) + 180, (i * 0.5) + 1)
						
				3:
					cshot(position.x, position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - position.y), deg_to_rad(Global.zpx - position.x))), 10)
			queue_free()
	else:
		if count == 50:
			appearance = 1

	count = count + 1

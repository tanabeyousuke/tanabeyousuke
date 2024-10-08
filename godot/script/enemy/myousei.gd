extends Area2D

var count = 0
var hp = 1600
const type = "enemy"

var rl = 0
var appearance = 0
var scriptnum = 1
var state = 0
var opt = 0

var missile = preload('res://seen/enemy/missile.tscn')
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

func myousei0():
	match state:
		0:
			position.y = position.y + (16 - (count / 2))
			if count % 5 == 0:
				cshot(position.x, position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - position.y), deg_to_rad(Global.zpx - position.x))), 5)
				cshot(position.x, position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - position.y), deg_to_rad(Global.zpx - position.x))), 10)
			
			if (count / 2) > 16:
				count = 0
				state = 1
		1:
			if count % 5 == 0:
				cshot(position.x, position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - position.y), deg_to_rad(Global.zpx - position.x))), 5)
				cshot(position.x, position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - position.y), deg_to_rad(Global.zpx - position.x))), 10)

			if count == 100:
				count = 0
				state = 2

		2:
			if rl == 0:
				position.x = position.x + 3
			else:
				position.x = position.x - 3
			position.y = position.y + 1

			if count % 50 == 0:
				for i in range(30):
					cshot(position.x, position.y, rad_to_deg(atan2(Global.zpy - position.y, Global.zpx - position.x)) + ((360 / 30) * i), 5)

func myousei1():
	match state:
		0:
			position.y = position.y + 3
			if abs(Global.zpx - global_position.x) < 50:
				var i = missile.instantiate()
				i.position.x = position.x
				i.position.y = position.y
				get_tree().root.add_child(i)
				state = 1
		1:
			position.y = position.y - 3
			rotation = deg_to_rad(180)				

func myousei2():
	position.x = cos(deg_to_rad((count) + (opt * 45))) * $"../".radius
	position.y = sin(deg_to_rad((count) + (opt * 45))) * $"../".radius
	match $"../".atk:
		1:
			if count % 5 == 0:
				for i in range(4):
					cshot(global_position.x, global_position.y, count + i * 90, 3)
		2:
			if count % 5 == 0:
				for i in range(4):
					cshot(global_position.x, global_position.y, $"../".atkangle + i * 90, 3)

func _process(delta):
	match scriptnum:
		0:
			myousei0()
		1:
			myousei1()
		2:
			myousei2()

	if appearance == 1:
		if hp < 0 or global_position.x < 35 or global_position.y < 35 or position.x > 635 or position.y > 825:
			if scriptnum == 1:
				for i in range(5):
					cshot(position.x, position.y, atan2(Global.zpy - global_position.y, Global.zpx - global_position.x), 10 + i)
			if scriptnum != 2:
				queue_free()
			elif hp < 0:
				queue_free()
	else:
		if count == 100:
			appearance = 1
			
	count = count + 1

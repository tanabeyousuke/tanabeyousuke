extends Area2D

var count = 0
var hp = 50
const type = "enemy"

var rl = 0
var appearance = 0
var scriptnum = 0
var opt = 100
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

func kedama0():
	position.y = position.y - 1.5
	if count % 60 == 0:
		cshot(position.x, position.y, 0, 1)
		cshot(position.x, position.y, 180, 1)

func kedama1():
	match state:
		0:
			position.x = position.x + 7 * cos(opt)
			position.y = position.y + 7 * sin(opt)

			if count == 15:
				state = 1
				count = 0

		1:
			if count == 30:
				state = 2
				count = 0

		2:
			var kakudo = atan2(deg_to_rad(Global.zpy - position.y), deg_to_rad(Global.zpx - position.x))
			position.x = position.x + cos(kakudo) * 7
			position.y = position.y + sin(kakudo) * 7

			if count % 60 == 0:
				for i in range(5):
					cshot(position.x, position.y, rad_to_deg(rotation) + (i * (360 / 5)), 10)

func kedama2():
	if count % 120 < 30:
		position.y = position.y + 5
	else:
		if count % 3 == 0:
			for i in range(3):
				if rl == 0:
					cshot(position.x, position.y, ((i - 1) * 5) - (count * 7), 5)
				else:
					cshot(position.x, position.y, ((i - 1) * 5) + (count * 7), 5)

func kedama3():
	if rl == 0:
		position.x = position.x + 2
	else:
		position.x = position.x - 2

func _process(delta):
	$"Sprite2D".rotation = $"Sprite2D".rotation + 1
	match scriptnum:
		0:
			kedama0()
		1:
			kedama1()
		2:
			kedama2()
		3:
			kedama3()

	if appearance == 1:
		if hp < 0 or position.x < -25 or position.y < -25 or position.x > 625 or position.y > 825:
			match scriptnum:
				3:
					for ro in range(5):
						cshot(position.x, position.y, rad_to_deg(atan2(Global.zpy - position.y, Global.zpx - position.x)), 3 * ro)
			queue_free()
	else:
		if count == 50:
			appearance = 1

	count = count + 1

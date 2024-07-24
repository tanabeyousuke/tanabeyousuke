extends Area2D

var count = 0
var start = 0
var state = 0
var hp = 200
const type = "enemy"

var tama = preload("res://seen/tama.tscn")

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

func _process(delta):
	if hp <= 0 or global_position.y > 800 or global_position.y < 0:
		$"../".breaked()
		queue_free()
		
	match state:
		0:
			position.y = cos(deg_to_rad(count)) * 200 + 270
			if count == 540:
				state = 1
				count = 0
			if count % 360 < 180:
				rotation = deg_to_rad(-90)
			else:
				rotation = deg_to_rad(90)
		1:
			if count > 90:
				state = 2

		2:
			rotation = atan2(deg_to_rad(Global.zpy - position.y) , deg_to_rad(Global.zpx - position.x))
			position.x = position.x + cos(rotation) * 3
			position.y = position.y + sin(rotation) * 3


			if count % 20 == 0:
				cshot(position.x, position.y, rad_to_deg(rotation), 5)
				cshot(position.x, position.y, rad_to_deg(rotation) + 30, 3)
				cshot(position.x, position.y, rad_to_deg(rotation) - 30, 3)
				
	count = count + 1		

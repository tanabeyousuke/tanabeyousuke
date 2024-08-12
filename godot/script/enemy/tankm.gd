extends Area2D

var count = 0
var hp = 1000
const type = "tizyou"
var state = 0
var rl = 0

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

func _process(delta):
	position.y = position.y + 1
	match state:
		0:
			if rl == 0:
				position.x = position.x + 1
				rotation = deg_to_rad(270)
				$"houtou".global_rotation = deg_to_rad(270)
				if position.x == 100:
					state = 1
			else:
				position.x = position.x - 1
				rotation = deg_to_rad(90)
				$"houtou".global_rotation = deg_to_rad(90)
				if position.x == 500:
					state = 1
		1:
			$"houtou".global_rotation = atan2(Global.zpy - global_position.y, Global.zpx - global_position.x) - deg_to_rad(90)
			if count % 12 == 0:
				cshot(global_position.x + rad_to_deg(cos($"houtou".global_rotation + deg_to_rad(90))) * 0.4, global_position.y + rad_to_deg(sin($"houtou".global_rotation + deg_to_rad(90))) * 0.4, rad_to_deg($"houtou".global_rotation) + 90, 10)

	count = count + 1
			
			
		

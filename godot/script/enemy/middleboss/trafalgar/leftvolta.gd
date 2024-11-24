extends Area2D

var count = 0
var hp = 7500

var tama = preload('res://seen/tama.tscn')

const type = "tizyou"

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


var bangle = 0
func _process(delta):
	var sbposy = global_position.y - 100

	if $"../".attack == 3:
		if count % 100 <= 40:
			if count % 100 == 0:
				bangle = rad_to_deg(atan2(Global.zpy - sbposy, Global.zpx - global_position.x))

			var sangle = bangle + (randi() % 90 - 45) + randf()
			var shotposx = global_position.x + cos(deg_to_rad(randi())) * (randi() % 10)
			var shotposy = sbposy + sin(deg_to_rad(randi())) * (randi() % 10)
			cshot(shotposx, shotposy, sangle, 8)
			cshot(shotposx + cos(deg_to_rad(sangle)) * 100,
				shotposy + sin(deg_to_rad(sangle)) * 100,
				sangle, 3)
	count = count + 1

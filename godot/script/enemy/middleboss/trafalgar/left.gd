extends Area2D

var count = 0
var hp = 20000

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
func _process(delta: float) -> void:
	if $"../".attack == 1:
		if count % 60 <= 40:
			var t = count % 60
			if count % 60 == 0:
				bangle = rad_to_deg(atan2(Global.zpy - global_position.y, Global.zpx - global_position.x))

			if count % 5 == 0:
				cshot(global_position.x, global_position.y, bangle + t - 30, 3)
				cshot(global_position.x, global_position.y, bangle + t, 3)
				cshot(global_position.x, global_position.y, bangle + t + 30, 3)

		if (count - 20) % 60 <= 40 and count > 20:
			var t = (count - 20) % 60
			if count % 5 == 0:
				cshot(global_position.x, global_position.y, bangle - t + 30, 3)
				cshot(global_position.x, global_position.y, bangle - t, 3)
				cshot(global_position.x, global_position.y, bangle - t - 30, 3)
				


	count = count + 1

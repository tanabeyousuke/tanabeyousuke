extends Area2D

var count = 0
var hp = 5000

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
	if "../".atack == 1:
		if count % 150 <= 100:
			if count % 150 == 0:
				bangle = rad_to_deg(atan2(Global.zpy - global_position.y, Global_zpx - global_position.x))

			if count % 5 == 0:
				
				


	count = count + 1

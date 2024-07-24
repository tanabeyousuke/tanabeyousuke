extends Area2D

var count = 7
var hp = 1000
const type = "tizyou"

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
	if count % 15 == 0:
		for i in range(10):
			cshot(global_position.x + rad_to_deg(cos(global_rotation + deg_to_rad(90))), global_position.y + rad_to_deg(sin(global_rotation + deg_to_rad(90))), rad_to_deg(global_rotation) + 90, i * 1.5 + 1)

	position.y = (count % 15) + 43

	if hp < 0:
		$"../".right = 0
		queue_free()

	count = count + 1

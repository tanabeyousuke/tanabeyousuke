extends Area2D

var tama = preload('res://seen/tama.tscn')
var hp = 1000
var count = 0
const type = "enemy"

var serial = 0

func hit(damage):
	hp = hp - damage
	if hp <= 0:
		queue_free()

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

func _process(delta):
	var bangle = $"../".count + serial * 45
	position.x = cos(deg_to_rad(bangle)) * 200
	position.y = sin(deg_to_rad(bangle)) * 170

	if $"../".count % 15 == 0:
		for i in range(5):
			cshot(global_position.x, global_position.y, bangle + (i - 3) * 10, 5)

extends Area2D

var hp = 1000
var count = 0
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
	if count % 40 == 0:
		var sangle = rad_to_deg(global_rotation) + 90
		var spx = $"left".global_position.x
		var spy = $"left".global_position.y
		cshot(spx, spy, sangle, 4)
		
	elif count % 40 == 20:
		var sangle = rad_to_deg(global_rotation) + 90
		var spx = $"right".global_position.x
		var spy = $"right".global_position.y
		cshot(spx, spy, sangle, 4)

	if hp <= 0:
		queue_free()
		$"../".broke()
	count = count + 1

extends Area2D

var tama = preload('res://seen/tama.tscn')
var hp = 200
const type = "tizyou"

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

var count = 0
var appearance = false
func _process(delta):
	if global_position.y > -45 or global_position.y < 825 or global_position.x > -25 or global_position.x < 625:
		if count == 30:
			$"houdai".global_rotation = atan2(deg_to_rad(Global.zpy - global_position.y) , deg_to_rad(Global.zpx - global_position.x)) - deg_to_rad(90)
			count = 0
			cshot(global_position.x + rad_to_deg(cos($"houdai".global_rotation + deg_to_rad(90))), global_position.y + rad_to_deg(sin($"houdai".global_rotation + deg_to_rad(90))), rad_to_deg($"houdai".global_rotation) + 90, 10)
		position.x = position.x + cos(rotation) * 2
		position.y = position.y + sin(rotation) * 2
		count = count + 1
		appearance = true
	else:
		if appearance == true:
			queue_free()

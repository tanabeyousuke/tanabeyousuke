extends Sprite2D

var tama = preload('res://seen/tama.tscn')
const type = "tizyou"

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

var count = 0
var g = false
func _process(delta):
	if global_position.y > -45 or global_position.y < 825 or global_position.x > -25 or global_position.x < 625:
		g = true
		if count == 20:
			count = 0
			$"masingan".rotation = atan2(deg_to_rad(Global.zpy - global_position.y) , deg_to_rad(Global.zpx - global_position.x)) - deg_to_rad(90)
		cshot(global_position.x + rad_to_deg(cos($"masingan".rotation + deg_to_rad(90))), global_position.y + rad_to_deg(sin($"masingan".rotation + deg_to_rad(90))), rad_to_deg($"masingan".rotation) + 90, 10)
		count = count + 1
	elif g:
		queue_free()

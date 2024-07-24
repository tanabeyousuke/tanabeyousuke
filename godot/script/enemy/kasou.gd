extends Area2D

var count = 0
var hp = 100
const type = "enemy"

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
	$"Puropera".rotation = $"Puropera".rotation + 5

	if hp <= 0:
		$"../".breaked()
		queue_free()

	match $"../".state:
		0:
			pass
		1:
			rotation = atan2(deg_to_rad(Global.zpy - position.y) , deg_to_rad(Global.zpx - position.x)) - deg_to_rad(90)
			if $"../".count % 20 == 0:
				cshot(global_position.x + cos(rotation + deg_to_rad(90)) * 25, global_position.y + sin(rotation + deg_to_rad(90)) * 25, rad_to_deg(rotation) + 90, 10)
				
		2:
			rotation = deg_to_rad(180)
			global_position.y = global_position.y - 5
			if position.y < -50 :
				$"../".breaked()
				queue_free()

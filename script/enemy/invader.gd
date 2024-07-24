extends Area2D

var mystate = 0
var rl = 0
var start
var hp = 500
const type = "enemy"
var color = 0

var tama = preload('res://seen/tama.tscn')

func hit(damage):
	hp = hp - damage

func cshot (x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)
	
func _ready():
	if color == 1:
		$"Sprite2D".frame = 2
	if color == 2:
		$"Sprite2D".frame = 4

func _process(delta):
	match $"../".state:
		0:
			if rl == 0:
				global_position.x = global_position.x + 10
			else:
				global_position.x = global_position.x - 10

		1:
			if $"../".count % 40 == 0:
				cshot(global_position.x, global_position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - global_position.y), deg_to_rad(Global.zpx - global_position.x))), 7)
				cshot(global_position.x, global_position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - global_position.y), deg_to_rad(Global.zpx - global_position.x))) + 45, 7)
				cshot(global_position.x, global_position.y, rad_to_deg(atan2(deg_to_rad(Global.zpy - global_position.y), deg_to_rad(Global.zpx - global_position.x))) - 45, 7)

		2:
			if rl == 0:
				global_position.x = global_position.x + 10
			else:
				global_position.x = global_position.x - 10

			if global_position.x < -60 or global_position.x > 660:
				$"../".breaked()
				queue_free()

	if $"../".count % 30 == 0:
		$"Sprite2D".frame = $"Sprite2D".frame - 1

	if $"../".count % 30 == 15:
		$"Sprite2D".frame = $"Sprite2D".frame + 1

	if hp < 0:
		$"../".breaked()
		queue_free()







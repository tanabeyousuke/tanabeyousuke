extends Area2D

var stopx = 300
var count = 0
var cycle = 0
var state = 0
var hp = 100
const type = "enemy"

var tama = preload('res://seen/tama.tscn')

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
	$"../".add_child(bullet)

func _process(delta):
	$"Puropera".rotation = $"Puropera".rotation + 5
	match state:
		0:
			position.y =  position.y + ((stopx - position.y) / 30 ) * 2
			if position.y > stopx - 5:
				state = 1
		1:
			rotation = atan2(deg_to_rad(Global.zpy - position.y) , deg_to_rad(Global.zpx - position.x)) - deg_to_rad(90)
			if cycle == 180 :
				state = 2
			cycle = cycle + 1
			cshot(global_position.x + cos(rotation + deg_to_rad(90)) * 25, global_position.y + sin(rotation + deg_to_rad(90)) * 25, rad_to_deg(rotation) + 90, 10)
		2:
			rotation = deg_to_rad(180)
			position.y = position.y - 5
			if position.y < -50 :
				queue_free()

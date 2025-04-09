extends Area2D

var tama = preload('res://seen/tama.tscn')
var hp = 20000
var count = 0
var engine = 0
const type = "enemy"

var phase = 0
var basey = 0
var nothere = preload('res://seen/enemy/middleboss/itamae/nothere.tscn')

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

func _ready():
	for i in range(8):
		var tobacco = nothere.instantiate()
		tobacco.serial = i
		add_child(tobacco)

func _process(delta):
	
	global_position.x = 300 + cos(deg_to_rad(count * 3)) * 150
	global_position.y = basey + sin(deg_to_rad(count * 6)) * 25

	match phase:
		0:
			basey = basey + 3
			if basey > 250:
				phase = 1
		1:
			if count % 60 == 0:
				var toziki = rad_to_deg(atan2(Global.zpy - global_position.y, Global.zpx - global_position.x))
				cshot(global_position.x, global_position.y, toziki + 5, 10)
				cshot(global_position.x, global_position.y, toziki - 5, 10)
				
			if count == 1400:
				phase = 2
		2:
			basey = basey - 3
			if basey < -300:
				queue_free()
	
	count = count + 1

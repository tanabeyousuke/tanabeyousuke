extends Area2D

var tama = preload('res://seen/tama.tscn')
var hp = 20000
var count = 0
var engine = 0
const type = "enemy"

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
	if $"../".movestate == 3:
		if engine != 1:
			if global_position.x == 300:
				engine = 1

	if engine == 1:
		# global_position.x = 300 +  

		count = count + 1

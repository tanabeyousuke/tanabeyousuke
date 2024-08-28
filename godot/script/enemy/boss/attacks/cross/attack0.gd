extends Area2D

var p = 0
var hp = 50000
var count = 0
var tama = preload('res://seen/tama.tscn')
const type = "tairetu"
const soten = 2500

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

func _init():
	p.atkobj = $"./"

func _process(delta):
	p.position.x = cos(deg_to_rad(count / 2)) * 200 + 300
	p.position.y = sin(deg_to_rad(count)) * 30 + 200
	
	var speed = (count % 20) / 4 + 1
	var atoz = rad_to_deg(atan2(Global.zpy - p.position.y, Global.zpx - p.position.x))
	if count % 2 == 0:
		for i in range(10):
			var angle = atoz + i * 36 + count
			cshot(p.position.x, p.position.y, angle, speed)
			
	if count == 7200 or hp <= 0:
		p.delay = 150
		queue_free()


	count = count + 1

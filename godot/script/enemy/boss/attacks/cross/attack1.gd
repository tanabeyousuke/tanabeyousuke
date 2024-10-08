extends Area2D

var p = 0
var hp = 60000
var count = 0
var tama = preload('res://seen/tama.tscn')
const type = "tairetu"
const soten = 2500

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

func _process(delta):
	if count % 2 == 0:
		var baseangle
		var ha
		if count % 360 >= 180:
			baseangle = (count % 180) * 10
			ha = 15
		else:
			baseangle = (180 - (count % 180)) * 10
			ha = -15
			
		for i in range(5):
			var pointx = p.position.x + cos(deg_to_rad(baseangle + i * 72)) * 100
			var pointy = p.position.y + sin(deg_to_rad(baseangle + i * 72)) * 100
			for ro in range(3):
				var angles = baseangle + (i * 72) + (ro * ha) + 180
				var speeds = ro + 3
				cshot(pointx, pointy, angles, speeds)

	p.position.x = 300 + cos(deg_to_rad(count)) * 20
	p.position.y = 200 + sin(deg_to_rad(count)) * 20

	if count == 7200 or hp <= 0:
		p.delay = 150
		queue_free()
				
	count = count + 1

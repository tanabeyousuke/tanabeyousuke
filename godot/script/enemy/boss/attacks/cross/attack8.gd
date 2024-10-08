extends Area2D

var p = 0
var hp = 60000
var count = 0
var tama = preload('res://seen/tama.tscn')
const type = "tairetu"
const soten = 2500
var opt1 = 0

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

var ud = 0
func _process(delta):
	if count == 240:
		ud = 1
	if ud == 1 and p.global_position.y > 750:
		ud = 2
	if ud == 2 and p.global_position.y < 200:
		ud = 3
		

	if ud == 1:
		p.position.y = p.position.y + 5
	if ud == 2:
		p.position.y = p.position.y - 4
		print(p.position.y)
		if count % 20 == 0:
			for i in range(10):
				cshot(30 + (i * 60), 799, 270, 4)
	if ud == 3:
		if count % 20 == 0:
			for i in range(10):
				cshot(30 + (i * 60), 799, 270, 4)
				
	var top = (count % 50) * 4

	if count % 60 < 30:
		if count % 15 == 0:
			for i in range(3):
				var shotp = top + i * 200
				for ro in range(4):
					var angle = 60 + (ro * 20)
					cshot(shotp, 1, angle, 3)
	else:
		var bottom = 600 - top
		for i in range(3):
			var shotp = bottom - i * 200
			cshot(shotp, 799, 270, 3)
	
	count = count + 1

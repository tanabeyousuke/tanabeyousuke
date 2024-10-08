extends Area2D

var state = 0
var count = 0
var hpstack = [50000, 15000]
var hppoint = 0
const type = "enemy"

var tama = preload('res://seen/tama.tscn')

func hit(damage):
	hpstack[hppoint] = hpstack[hppoint] - damage

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

func _process(delta):
	match state:
		0:
			position.y = position.y + 2
			if position.y == 0:
				count = 0
				state = 1
		1:
			position.x = position.x + 5
			position.y = position.y + 2
			if position.x == 550:
				count = 0
				state = 2
			
		2:
			if count % 540 < 180:
				position.x = cos(deg_to_rad(count)) * 250 + 300
				position.y = sin(deg_to_rad(count)) * 100 + 100
			else:
				for i in range(5):
					cshot(position.x, position.y, (count * 10.5) + (i * 30), 2)
		3:
			if count == 1:
				pass #アイキャッチを入れる
			position.x = position.x + (300 - position.x)
			position.y = position.y + (150 - position.y)
			if count == 240:
				state = 4
				count = 0
						
		4:
			if count % 30 == 0:
				for i in range(randi() % 7 + 10):
					if count % 60 == 0:
						cshot(10 + (i * 20), 0, 90, 2)
					else:
						cshot(590 - (i * 20), 0, 90, 2)

			for ro in range(3):
				cshot(position.x, position.y, count * 3 + (ro * 120) + (randi() % 45) - 22.5, 3)
	
	if hpstack[hppoint] < 0:
		if hppoint > 1:
			hppoint = hppoint + 1
		state = state + 1
		count = 0
	count = count + 1			

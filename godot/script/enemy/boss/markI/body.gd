extends Area2D

var count = 0
var hp = 50000
const type = "tizyou"
const soten = 50000
var num = 0
var tama = preload('res://seen/tama.tscn')

func hit(damage):
	hp = hp - damage

func cshot(x, y , angle, speed):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

var move = [5, 120, 1,  0, 30, 2,  -2, 105, 3,  0, 30, 4,  2, 105, 1]
var moveaddr = -1
var time = 0

func _process(delta):
	if count % 5 == 0:
		cshot(global_position.x - 20, global_position.y - 60, (count * 5) % 180 - ((randi() % 20) - 10), randi() % 3 + 2)
		cshot(global_position.x + 20, global_position.y - 60, 180 - ((count * 5) % 180 - ((randi() % 20) - 10)), randi() % 3 + 2)
		
	if moveaddr == -1:
		moveaddr = 0
		time = move[moveaddr * 3 + 1]

	position.y = position.y + move[moveaddr * 3]
	time = time - 1
	if time == 0:
		moveaddr = move[moveaddr * 3 + 2]
		time = move[moveaddr * 3 + 1]
	count = count + 1
	if hp < 1:
		queue_free()


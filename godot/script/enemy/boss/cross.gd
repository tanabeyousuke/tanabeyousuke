extends Area2D

var count = 0
var delay = 150
var atkobj = 0
const type = "enemy"
const soten = 100000

var atknum = 1

var attacks = [
	preload('res://seen/enemy/boss/attacks/cross/attack0.tscn'),
	preload('res://seen/enemy/boss/attacks/cross/attack1.tscn'),
]

func hit(damage):
	
func next():
	var i = attacks[atknum].instantiate()
	i.p = $"./"
	add_child(i)
	atknum = atknum + 1

func _process(delta):
	if delay > -1:
		delay = delay - 1
		position.x = position.x + (300 - position.x) / 30
		position.y = position.y + (200 - position.y) / 30
	if delay == 0:
		next()
		position.x = 300
		position.y = 200
	
	
	if atknum > 20:
		#var i = breakeffect.instantiate()
		#get_tree().root.add_child(i)
		pass

	count = count + 1
	

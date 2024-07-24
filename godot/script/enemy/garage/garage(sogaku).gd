extends Area2D

var sensya = preload("res://seen/enemy/sogaku.tscn")
var count = 0
var appearance = false
var hp = 500
const type = "tizyou"

func hit(damage):
	hp = hp - damage
	if hp <= 0:
		queue_free()

func _process(delta):
	if global_position.y > -45 and global_position.y < 825 and global_position.x > -25 and global_position.x < 625:
		appearance = true
		count = count + 1
		if count == 100:
			var i = sensya.instantiate()
			i.position = position
			i.rotation = deg_to_rad(get_meta("houkou"))
			$"../".add_child(i)
			count = 0
	else:
		if appearance == true:
			queue_free()

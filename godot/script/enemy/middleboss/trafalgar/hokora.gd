extends Area2D

var count = 0
var hp = 7000

var tama = preload('res://seen/tama.tscn')

const type = "tizyou"

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

var kaiten = 0
func _process(delta):
	if $"../".attack == 2:
		if count % 120 <= 100 and count % 4 == 0:
			if kaiten == 0:
				for i in range(9):
					var px = global_position.x + cos(deg_to_rad((i - 5) * 15 + (count * 3))) * 100
					var py = global_position.y + sin(deg_to_rad((i - 5) * 15 + (count * 3))) * 100
					cshot(px, py, (i - 5) * 15 + (count * 3), 4)
					
					px = global_position.x + cos(deg_to_rad((i - 5) * 15 + (count * 3) + 180)) * 100
					py = global_position.y + sin(deg_to_rad((i - 5) * 15 + (count * 3) + 180)) * 100
					
					cshot(px, py, (i - 5) * 15 + (count * 3), 6)
					if count % 120 == 100:
						kaiten = 1

			else:
				for i in range(9):
					var px = global_position.x + cos(deg_to_rad((i - 5) * 15 - (count * 3))) * 100
					var py = global_position.y + sin(deg_to_rad((i - 5) * 15 - (count * 3))) * 100
					cshot(px, py, (i - 5) * 15 - (count * 3), 3)
					
					px = global_position.x + cos(deg_to_rad((i - 5) * 15 - (count * 3) + 180)) * 100
					py = global_position.y + sin(deg_to_rad((i - 5) * 15 - (count * 3) + 180)) * 100
					
					cshot(px, py, (i - 5) * 15 - (count * 3), 6)
					if count % 120 == 100:
						kaiten = 0
				
	
	if hp <= 0:
		$"../".hit(3000)
		queue_free()
		
	count = count + 1
